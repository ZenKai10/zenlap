import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenlap/desc_page.dart';
import 'package:zenlap/services/database_service.dart';
import 'package:zenlap/services/firestore_service.dart';

class CategoryPage extends StatefulWidget {
  final String genre;
  final List<DataJam> dataForGenre; // Add this parameter

  const CategoryPage(
      {Key? key, required this.genre, required this.dataForGenre})
      : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.genre,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black, // Tampilkan nama kategori di app bar
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FireStoreService.getByGenre(widget.genre),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Or any other loading indicator
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('No data available');
          }

          List<DocumentSnapshot> data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var document = data[index].data() as Map<String, dynamic>;

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DescPage(
                        image: document['avatar'],
                        name: document['name'],
                        genre: document['genre'],
                        descripe: document['descripe'],
                        authorImageUrl: document['authorImageUrl'],
                        author: document['author'],
                        rating: document['rating'],
                        views: document['views'],
                      ),
                    ),
                  );
                },
                child: Padding(
                  // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.only(left: 8),
                  child: Card(
                    elevation: 10,
                    color: Colors.black,
                    shadowColor: Colors.grey, // warna bayangan
                    shape: RoundedRectangleBorder(
                      // untuk memberikan bentuk pada card
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          // padding: const EdgeInsets.symmetric(
                          //     vertical: 15, horizontal: 5),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Image.network(
                                    document['avatar'],
                                    width: 100,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              Container(
                                // padding: const EdgeInsets.all(10),
                                padding: const EdgeInsets.only(
                                  left: 12,
                                ),
                                height: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 15),
                                    Text(
                                      document['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    // SizedBox(height: 8),
                                    Container(
                                      width: 250,
                                      child: Text(
                                        document['descripe'],
                                        style: TextStyle(
                                            // fontSize: 16,
                                            // fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    // SizedBox(height: 10),
                                    // RatingBar.builder(
                                    //   initialRating: 5,
                                    //   minRating: 1,
                                    //   direction: Axis.horizontal,
                                    //   itemCount: 5,
                                    //   itemSize: 18,
                                    //   itemPadding:
                                    //       EdgeInsets.symmetric(horizontal: 4),
                                    //   itemBuilder: (context, _) => Icon(
                                    //     Icons.star,
                                    //     color: Colors.red,
                                    //   ),
                                    //   onRatingUpdate: (index) {},
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
