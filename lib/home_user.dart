import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenlap/services/firestore_service.dart';
// import 'package:prak3/tmp/services/firestore_service.dart';
// import 'package:prak6/services/firestore_service.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "List Community",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FireStoreService().getUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        List userList = snapshot.data!.docs;
                        return SizedBox(
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: userList.length,
                            itemBuilder: (context, Index) {
                              DocumentSnapshot documentSnapshot =
                                  userList[Index];
                              // DocumentSnapshot documentSnapshot = userList[Index];

                              Map<String, dynamic> data = documentSnapshot
                                  .data() as Map<String, dynamic>;

                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: Material(
                                  color: Colors.black,
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['fullname'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          data['username'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          data['email'],
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
