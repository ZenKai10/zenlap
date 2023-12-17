import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zenlap/navbar.dart';
import 'package:zenlap/register.dart';
import 'package:zenlap/services/firebase_auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user =
        await _authService.loginWithEmailandPassword(email, password, context);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Login Success",
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Navbar()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Login Failed",
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 99, 95, 95),
      backgroundColor: Colors.white,

      body: Padding(
        // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),

        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Transform.scale(
                scale: 4, // Ganti dengan faktor perbesaran yang diinginkan
                child: Image.asset(
                  'assets/images/logo5_.png', // Ganti dengan path gambar Anda
                  width: 100, // Sesuaikan dengan lebar gambar yang diinginkan
                  height: 100, // Sesuaikan dengan tinggi gambar yang diinginkan
                ),
              ),
            ),
            const SizedBox(height: 100.0),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.grey,
                    width: 2.0), // Warna dan ketebalan border
                borderRadius: BorderRadius.circular(
                    5.0), // Untuk sudut melengkung pada border
              ),
              color: Colors.white,
              child: TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: "Email Address",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.grey,
                    width: 2.0), // Warna dan ketebalan border
                borderRadius: BorderRadius.circular(
                    5.0), // Untuk sudut melengkung pada border
              ),
              color: Colors.white,
              child: TextField(
                controller: _passwordController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.grey,
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey)),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        5.0), // Ubah radius sesuai keinginan
                  ),
                ),
                onPressed: () {
                  login();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 4.0),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
