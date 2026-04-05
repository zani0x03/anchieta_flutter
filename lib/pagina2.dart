import 'package:flutter/material.dart'; 
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodPage(),
    );
  }
}

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  String? selected;
  final Map<String, List<FoodData>> data = {
    "Popular": [
      FoodData(Icons.fastfood, "Hambúrguer", "Grelhado", 4.8, 29.9),
      FoodData(Icons.local_pizza, "Pizza", "Forno", 4.7, 39.9),
      FoodData(Icons.ramen_dining, "Lamen", "Cozido", 4.9, 34.9),
      FoodData(Icons.lunch_dining, "Prato Executivo", "Na hora", 4.6, 24.9),
      FoodData(Icons.icecream, "Sobremesa", "Gelado", 4.5, 14.9),
    ],
    "Rápido": [
      FoodData(Icons.egg, "Omelete", "Frito", 4.5, 12.9),
      FoodData(Icons.local_cafe, "Café", "Pronto", 4.4, 8.9),
      FoodData(Icons.fastfood, "Hot Dog", "Montado", 4.7, 10.9),
      FoodData(Icons.rice_bowl, "Marmita", "Pré", 3.3, 19.9),
      FoodData(Icons.local_drink, "Suco", "Natural", 3.7, 9.9),
    ],
    "Saudável": [
      FoodData(Icons.eco, "Salada", "Cru", 3.8, 18.9),
      FoodData(Icons.rice_bowl, "Bowl Fit", "Equilibrado", 4.7, 22.9),
      FoodData(Icons.set_meal, "Frango", "Grelhado", 4.6, 25.9),
      FoodData(Icons.spa, "Wrap", "Leve", 3.5, 17.9),
      FoodData(Icons.local_florist, "Smoothie", "Batido", 4.1, 15.9),
    ],
    "Barato": [
      FoodData(Icons.fastfood, "X-Simples", "Chapa", 4.2, 9.9),
      FoodData(Icons.lunch_dining, "PF", "Caseiro", 4.6, 14.9),
      FoodData(Icons.ramen_dining, "Macarrão", "Cozido", 4.3, 11.9),
      FoodData(Icons.bakery_dining, "Pão com Ovo", "Frito", 2.8, 7.9),
      FoodData(Icons.local_pizza, "Mini Pizza", "Forno", 4.5, 12.9),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://wallpapers.com/images/hd/dark-wood-background-1920-x-1200-7iuvdbf2p8rgpuhx.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.yellow, Colors.orange],
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text('O que você quer comer hoje?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    FloatingActionButton.small( /// BOTAO DO CHAT
                      onPressed: () {
                      },
                      backgroundColor: Colors.white,
                      elevation: 2,
                      child: const Icon(
                        Icons.chat,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: data.keys.map((e) {
                    return GestureDetector(
                      onTap: () => setState(() => selected = e),
                      child: _filterChip(e, selected == e),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: selected == null
                    ? const Center(
                        child: Text(
                          "Selecione um filtro",
                          style: TextStyle(color: Colors.white70),
                        ),
                      )
                    : ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        children: data[selected]!
                            .map((item) => FoodItem(data: item))
                            .toList(),
                      ),
                   ),
                ],
             ),
          ),
        ),
     );
  }

  Widget _filterChip(String text, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.yellow, Colors.orange],
        ),
        borderRadius: BorderRadius.circular(20),
        border: active ? Border.all(color: Colors.white, width: 2.5) : null,
      ),
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}

class FoodData {
  final IconData icon;
  final String title;
  final String mode;
  final double rating;
  final double price;
  FoodData(this.icon, this.title, this.mode, this.rating, this.price);
}

class FoodItem extends StatelessWidget {
  final FoodData data;
  const FoodItem({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(data.icon, size: 35, color: Colors.orange),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),

                Text(
                  "Modo: ${data.mode}",
                  style: const TextStyle(color: Colors.white70),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 15),
                    
                    Text(
                      " ${data.rating}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 10),

                    Text(
                      "R\$ ${data.price.toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.greenAccent),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}