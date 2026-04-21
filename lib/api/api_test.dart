import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  Album.empty() 
      : userId = 0, 
        id = 0, 
        title = '';

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'userId': int userId, 'id': int id, 'title': String title} => Album(
        userId: userId,
        id: id,
        title: title,
      ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }

  @override
  String toString() {
    return 'Album(userId: $userId, id: $id, title: $title)';
  }

}

class AlbumInsertedDTO {
  final int id;
  final String title;

  AlbumInsertedDTO({required this.id, required this.title});

  factory AlbumInsertedDTO.fromJson(Map<String, dynamic> json) {
    return AlbumInsertedDTO(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }


  @override
  String toString() {
    return 'Album(id: $id, title: $title)';
  }
  // Album toEntity(int fallbackUserId) {
  //   return Album(
  //     userId: fallbackUserId,
  //     id: id,
  //     title: title,
  //   );
  // }
}


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Future<Album> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/2'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<AlbumInsertedDTO> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'title': title}),
    );

    if (response.statusCode == 201) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      return AlbumInsertedDTO.fromJson(body);
    } else {
      throw Exception('Failed to create album.');
    }
  }


  Future<AlbumInsertedDTO> updateAlbum(String title) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'title': title}),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      return AlbumInsertedDTO.fromJson(body);
    } else {
      throw Exception('Failed to update album.');
    }
  }


  Future<Album> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Album.empty();
    } else {
      throw Exception('Failed to delete album.');
    }
  }


  Future<List<Album>> fetchAlbums() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      return jsonList.map((jsonItem) => Album.fromJson(jsonItem as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }


  // var getAlbum = await fetchAlbum();

  // print(getAlbum.toString());

  // var insertAlbum = await createAlbum('Teste Anchieta'); 

  // print(insertAlbum.toString());

  // var update = await updateAlbum('Teste Anchieta'); 

  // print(update.toString());


  // var delete = await deleteAlbum('1'); 

  // print(delete.toString());



  // Chamada para buscar a lista
  print('Buscando lista de álbuns...');
  
  try {
    List<Album> albums = await fetchAlbums();

    // Mostrando apenas os 5 primeiros para não encher o console
    print('Total de álbuns recebidos: ${albums.length}');
    print('--- Primeiros 5 itens ---');
    
    albums.take(5).forEach((album) {
      print('ID: ${album.id} | Título: ${album.title}');
    });

    albums.forEach((album) {
      print('ID: ${album.id} | Título: ${album.title}');
    });

  } catch (e) {
    print('Erro: $e');
  }
}