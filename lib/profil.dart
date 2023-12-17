import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zenlap/login.dart';
import 'package:zenlap/services/database_service.dart';
import 'package:zenlap/services/firestore_service.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      final email = user.email;
      if (email != null) {
        final myUser = await FireStoreService.getUser(email: email);
        if (myUser != null) {
          setState(() {
            _currentUser = myUser;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 11, 53, 115),
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
      //   actions: [
      //     IconButton(
      //       icon:
      //           Icon(Icons.logout), // Ganti dengan ikon logout yang diinginkan
      //       onPressed: () {
      //             _auth.signOut();
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => const Login(),
      //               ),
      //             );
      //           },
      //     ),
      //   ],
      // ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          InkWell(
              onTap: () {
                _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Transform.scale(
                  scale: 1.5,
                  child: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              if (_currentUser != null)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage('assets/images/sjw.jpg'),
                    // NetworkImage(
                    //     "https://i.pinimg.com/564x/d3/0e/0f/d30e0f6bab82c3937c90c1485f0c0942.jpg"), // Pastikan ini benar
                  ),
                ),
              // const SizedBox(height: 20),

              ForName("Name", _currentUser?.fullname ?? ""),

              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    label: Text(
                      "GitHub",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  ElevatedButton.icon(
                    icon: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    label: Text(
                      "LinkedIn",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  ElevatedButton.icon(
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    label: Text(
                      "Twitter",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              if (_currentUser == null)
                Center(
                  child: Container(
                    width: 60.0, // Lebar container
                    height: 60.0, // Tinggi container
                    decoration: BoxDecoration(
                      shape: BoxShape
                          .circle, // Mengatur bentuk container menjadi lingkaran
                      color: Colors.white, // Warna latar belakang container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, // Warna bayangan
                          blurRadius: 6.0, // Radius bayangan
                          spreadRadius: 1.0, // Sebaran bayangan
                        ),
                      ],
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                  ),
                )
              else
                Column(
                  children: [
                    ProfileInfo(Icons.phone, _currentUser?.notlp ?? "",
                        onPressed: () {
                      // Lakukan sesuatu ketika tombol ditekan
                    }),
                    // const SizedBox(height: 20),
                    ProfileInfo(Icons.email, _currentUser?.email ?? "",
                        onPressed: () {
                      // Lakukan sesuatu ketika tombol ditekan
                    }),
                  ],
                ),

              //   const SizedBox(height: 20),
              //   if (_currentUser != null)
              //     ElevatedButton(
              //       onPressed: () {
              //         _auth.signOut();
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const Login(),
              //           ),
              //         );
              //       },
              //       child: Text('Log Out'),
              //     ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForName extends StatelessWidget {
  final String label;
  final String value;

  ForName(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      // height: 80,
      // width: 800,
      // decoration: BoxDecoration(
      //   color: Color.fromARGB(255, 11, 53, 115),
      //   borderRadius: BorderRadius.circular(10),
      //   boxShadow: [
      //     BoxShadow(
      //       offset: const Offset(0, 5),
      //       color: Colors.deepPurple.withOpacity(.2),
      //       spreadRadius: 2,
      //       blurRadius: 10,
      //     ),
      //   ],
      // ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   label,
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontWeight: FontWeight.bold,
          //     fontFamily: 'OpenSans',
          //     fontSize: 17,
          //   ),
          // ),
          // SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final IconData icon;
  final String value;
  final void Function()? onPressed;

  ProfileInfo(this.icon, this.value, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.black,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
