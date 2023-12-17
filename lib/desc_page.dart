// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:uas/tmp/services/firestore_service.dart';
import 'package:zenlap/widget/custom_tag.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DescPage extends StatelessWidget {
  final String image,
      name,
      genre,
      descripe,
      authorImageUrl,
      author,
      rating,
      views;

  const DescPage({
    Key? key,
    required this.image,
    required this.name,
    required this.genre,
    required this.descripe,
    required this.authorImageUrl,
    required this.author,
    required this.rating,
    required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(

          // child: StreamBuilder<QuerySnapshot>(
          //   stream: FireStoreService().getJam(),
          //   builder: (context, snapshot) {

          //     List userList = snapshot.data!.docs;
          //               return SizedBox(
          //                 width: double.infinity,
          //                 child: ListView.builder(
          //                   shrinkWrap: true,
          //                   padding: const EdgeInsets.symmetric(vertical: 15),
          //                   physics: const NeverScrollableScrollPhysics(),
          //                   // itemCount: userList.length,
          //                   itemCount: 1,
          //                   itemBuilder: (context, Index) {
          //                     DocumentSnapshot documentSnapshot = userList[Index];
          //                     // DocumentSnapshot documentSnapshot = userList[Index];

          //                     Map<String, dynamic> data =
          //                         documentSnapshot.data() as Map<String, dynamic>;

          child: Container(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.network(
                  image,
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 22.0,
              ),
              // const SizedBox(
              //   height: 10.0,
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: CustomTag(
                      backgroundColor: Colors.grey.withAlpha(150),
                      children: [
                        Text(
                          genre,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 2.0,
              // ),
              const SizedBox(
                height: 4.0,
              ),

              Container(
                // color: Colors.amber,
                padding: const EdgeInsets.only(top: 10.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  // color: Color.fromARGB(255, 135, 110, 239), purple
                  color: Colors.white,
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTag(
                      backgroundColor: Colors.black,
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: NetworkImage(
                            authorImageUrl,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          author,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    CustomTag(
                      backgroundColor: Colors.grey.shade200,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          rating,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    CustomTag(
                      backgroundColor: Colors.grey.shade200,
                      children: [
                        const Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          views,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),

              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16),
              //   child: Text(
              //         data['genre'],

              //     style: TextStyle(
              //       fontSize: 16,
              //     ),
              //     textAlign: TextAlign.justify,
              //   ),
              // ),
              // SizedBox(height: 10),
              // RatingBar.builder(
              //   initialRating: 5,
              //   minRating: 1,
              //   direction: Axis.horizontal,
              //   itemCount: 5,
              //   itemSize: 20,
              //   itemPadding: EdgeInsets.symmetric(horizontal: 5),
              //   itemBuilder: (context, _) => Icon(
              //     Icons.star,
              //     color: Colors.red,
              //   ),
              //   onRatingUpdate: (index) {},
              // ),
              // SizedBox(height: 15),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                padding: const EdgeInsets.only(
                    top: 15, left: 12, right: 12, bottom: 15),

                child: Text(
                  descripe,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      )
          //   },
          //                 ),
          //               );
          //   }
          // ),
          ),
    );
  }
}
