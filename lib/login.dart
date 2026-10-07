import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

// HALAMAN LOGIN
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == "admin" && password == "12345") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username atau password salah")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffdada),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.music_note, size: 50, color: Color(0xffc94f5c)),

              const SizedBox(height: 15),

              const Text(
                "Masuk ke Meluna",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffc94f5c),
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: 280,
                height: 50,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: const Color(0xffeeeeee),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: 280,
                height: 50,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    filled: true,
                    fillColor: const Color(0xffeeeeee),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: 220,
                height: 50,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffeeeeee),
                    foregroundColor: const Color(0xffc94f5c),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HALAMAN DAFTAR LAGU
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffdada),

      appBar: AppBar(
        title: const Text(
          "Meluna",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffc94f5c),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [
            // KATEGORI
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [kategori("Semua"), kategori("Pop"), kategori("Rock")],
            ),

            const SizedBox(height: 25),

            // LAGU 1
            lagu("1", "APT", "Rose & Bruno Mars"),

            const SizedBox(height: 12),

            // LAGU 2
            lagu("2", "Remaja", "Hivi!"),
          ],
        ),
      ),

      // MENU BAWAH
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xffc94f5c),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Cari"),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Koleksi",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }

  Widget kategori(String nama) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(nama),
    );
  }

  Widget lagu(String nomor, String judul, String penyanyi) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            nomor,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(width: 15),

          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xffffc1c8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.music_note, color: Color(0xffc94f5c)),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(penyanyi, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          const Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
