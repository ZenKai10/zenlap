import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenlap/desc_page.dart';
import 'package:zenlap/genre_page.dart';
import 'package:zenlap/services/database_service.dart';
import 'package:zenlap/services/firestore_service.dart';
import 'package:zenlap/user.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<DataJam> dataanalog = data_analog
      .map((e) => DataJam.fromJson(e))
      .toList(); // Inisialisasi data produk dari data_user
  List<DataJam> datadigital =
      data_digital.map((e) => DataJam.fromJson(e)).toList();
  List<DataJam> datasport = data_sport.map((e) => DataJam.fromJson(e)).toList();
  List<DataJam> datasmartwatch =
      data_smartwatch.map((e) => DataJam.fromJson(e)).toList();
  List<DataJam> dataformal =
      data_formal.map((e) => DataJam.fromJson(e)).toList();
  List<DataJam> dataanalog2 =
      data_analog2.map((e) => DataJam.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ZenLap",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 8, 255),
        centerTitle: true,
      ),
      //backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  // TextField(
                  //   style: TextStyle(color: Colors.white),
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Colors.black,
                  //     prefixIcon: const Icon(
                  //       Icons.search_outlined,
                  //       color: Colors.white,
                  //     ),
                  //     hintText: 'Cari Jam',
                  //     hintStyle: TextStyle(color: Colors.grey),

                  //     border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(20.0),
                  //     borderSide: BorderSide.none,
                  //   ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Divider(
            //   color: Colors.black,
            // ),
            // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Type",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    //Single Item
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: 100, // Lebar kotak
                        height: 50, // Tinggi kotak
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 8, 255),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                        genre: "Gaming",
                                        dataForGenre: dataanalog)));
                          },
                          child: Text(
                            "Gaming", // Nama kategori
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15, // Warna teks
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: 100, // Lebar kotak
                        height: 50, // Tinggi kotak
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 8, 255),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                        genre: "Notebook",
                                        dataForGenre: datadigital)));
                            // Fungsi yang akan dijalankan ketika tombol ditekan
                          },
                          child: Text(
                            "Notebook", // Nama kategori
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13, // Warna teks
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: 120, // Lebar kotak
                        height: 50, // Tinggi kotak
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 8, 255),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                        genre: "Flipbook",
                                        dataForGenre: datasport)));
                          },
                          child: Text(
                            "Flipbook", // Nama kategori
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15, // Warna teks
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: 130, // Lebar kotak
                        height: 50, // Tinggi kotak
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 8, 255),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                        genre: "Macbook",
                                        dataForGenre: datasmartwatch)));
                          },
                          child: Text(
                            "Macbook", // Nama kategori
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15, // Warna teks
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    // "Popular",
                    "Recommended",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // TextButton(
                  //   child: Text(
                  //     "View All",
                  //   ),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 200,
              child: StreamBuilder<QuerySnapshot>(
                stream: FireStoreService.getData("Recommended"),
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
                    scrollDirection: Axis.horizontal,
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
                            color: Color.fromARGB(255, 0, 8, 255),
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Image.network(
                                    document['avatar'],
                                    width: 100,
                                    height: 120,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    document['name'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    // "Latest Anime",
                    "Best of 2023",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // TextButton(
                  //   child: Text("View All"),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              // height: 910,
              height: 480,
              child: StreamBuilder<QuerySnapshot>(
                stream: FireStoreService.getData("Best of 2023"),
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

                  return Container(
                    height: 480,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var document =
                            data[index].data() as Map<String, dynamic>;

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
                              color: const Color.fromARGB(255, 0, 8, 255),
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
                                          padding: const EdgeInsets.all(12),
                                          height: 150,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                document['name'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // SizedBox(height: 8),
                                              Container(
                                                width: 250,
                                                child: Text(
                                                  document['descripe'],
                                                  style: TextStyle(
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
                                              //   itemPadding: EdgeInsets.symmetric(
                                              //       horizontal: 4),
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
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    // "Popular",
                    "Top Rated Laptop",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // TextButton(
                  //   child: Text(
                  //     "View All",
                  //   ),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
            Container(
              height: 200,
              child: StreamBuilder<QuerySnapshot>(
                stream: FireStoreService.getData("Top Rated Watch"),
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
                    scrollDirection: Axis.horizontal,
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
                            color: const Color.fromARGB(255, 0, 8, 255),
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Image.network(
                                    document['avatar'],
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    document['name'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
