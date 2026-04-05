import 'package:flutter/material.dart';
void main() {
  runApp(const MyAppLogin());
}

class MyAppLogin extends StatelessWidget {
  const MyAppLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 20),
            child: Column(
              children: [
                const Spacer(),

                /// LOGO CIRCULAR
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white10,
                  ),
                  child: const Icon(
                    Icons.restaurant,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
                const SizedBox(height: 2),

                const Text('Sabor & Jornada',
                  style: TextStyle(
                    fontFamily: 'Kelin Eator',
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),

                Container(
                  width: 270,
                  height: 2,
                  color: Colors.white,
                ),
                const SizedBox(height: 30),

                _inputField('Email ou usuário'),
                const SizedBox(height: 10),

                _inputField('Senha'),
                const SizedBox(height: 20),

                const Text('ou',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),

                /// BOTÃO GOOGLE
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network('https://cdn-icons-png.flaticon.com/512/2991/2991148.png',
                        height: 20,
                      ),
                      const SizedBox(width: 10),
                      const Text('Continuar com Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                /// BOTÃO ENTRAR
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Colors.yellow, Colors.orange],
                      ),
                    ),
                    child: const Center(
                      child: Text('Entrar',
                        style: TextStyle(
                          fontFamily: 'Kelin Eator',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                const Text('Esqueceu a senha?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hint, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.black54,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}