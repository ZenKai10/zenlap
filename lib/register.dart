import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:review_anime/login.dart';
// import 'package:review_anime/services/database_service.dart';
// import 'package:review_anime/services/firebase_auth_service.dart';
// import 'package:review_anime/services/firestore_service.dart';
import 'package:zenlap/login.dart';
import 'package:zenlap/services/database_service.dart';
import 'package:zenlap/services/firebase_auth_service.dart';
import 'package:zenlap/services/firestore_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _notlpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  void dispose() {
    _fullnameController.dispose();
    _notlpController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void register() async {
    String fullname = _fullnameController.text;
    String notlp = _notlpController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =
        await _authService.signUpWithEmailandPassword(email, password, context);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "User is Sucessfully created",
          ),
          backgroundColor: Colors.green,
        ),
      );

      final myUser = MyUser(
        // Menggunakan nama kelas MyUser yang telah diganti
        fullname: fullname,
        email: email, // Alamat email pengguna
        notlp: notlp,
      );

      await FireStoreService.tambahUser(user: myUser); // Menggunakan MyUser

      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot create user"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Color.fromARGB(255, 99, 95, 95),
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
            const SizedBox(
              height: 100.0,
            ),
            // const Text(
            //   "Register",
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 24,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
            const SizedBox(height: 20.0),
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
                controller: _fullnameController,
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_box_rounded,
                    color: Colors.grey,
                  ),
                  hintText: "Full Name",
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
                controller: _notlpController,
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.ad_units_rounded,
                    color: Colors.grey,
                  ),
                  hintText: "No Telepon",
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
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.key,
                    color: Colors.grey,
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
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
                  register();
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already has an account?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8.0),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
