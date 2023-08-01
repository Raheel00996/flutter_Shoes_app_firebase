import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ui/Modal/constant.dart';
import 'package:sizer/sizer.dart';

class data extends StatelessWidget {
  final img2 = [
    {
      "images": "assets/img (1).jpg",
    },
    {
      "images": "assets/img (2).jpg",
    },
    {
      "images": "assets/img (6).jpg",
    },
  ];
  bool isloding = false;
  Future loadimage() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    return snapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wht,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 170,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black,
                    color1
                  ], // Add your desired colors here
                ),
                // image: const DecorationImage(
                //
                // ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 180,
                    top: -27,
                    child: Image.asset(
                      'assets/er.png',
                      width: 170,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: Text(
                      'New Release',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: grecolor),
                    ),
                  ),
                  const Positioned(
                    top: 46,
                    left: 30,
                    child: Text(
                      'Nike Air',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 80,
                    left: 30,
                    child: Text(
                      'Max 90',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 120,
                      left: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(33),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(wht),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Shop Now',
                              style: TextStyle(
                                  color: blk, fontWeight: FontWeight.bold),
                            )),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Features',
                        style: Textsty1,
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 170,
                      child: FutureBuilder(
                          future: loadimage(),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: color1,
                                ),
                              );
                            }
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: ((context, index2) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 140,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 207, 204, 204),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              blurStyle: BlurStyle.outer,
                                              offset: Offset(1, 2)),
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data[index2]['imageURLs']),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 10,
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  3),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  3)),
                                                  color: color1),
                                              child: Center(
                                                  child: Text(
                                                '3%',
                                                style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ),
                                          Positioned(
                                              top: 16.h,
                                              left: 4.w,
                                              child: Text(
                                                '\$${snapshot.data[index2]['price']}'
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                }));
                          }))),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Discover', style: Textsty1),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CarouselSlider(
                      items: img2
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 13),
                                child: Container(
                                  height: 300,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          e['images']!,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2)),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
