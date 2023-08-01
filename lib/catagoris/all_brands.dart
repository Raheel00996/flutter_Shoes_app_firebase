import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:ui/Modal/constant.dart';
import 'package:ui/splash_screen/splash_screen.dart';
import 'package:sizer/sizer.dart';

import '../Add_to_cart_data/Detail_Screen.dart';
import '../Add_to_cart_data/MY_Cart.dart';

class All_Brands extends StatefulWidget {
  const All_Brands({
    super.key,
  });

  @override
  State<All_Brands> createState() => _All_BrandsState();
}

class _All_BrandsState extends State<All_Brands> {
  bool isloding = false;
  Future loadimage() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    return snapshot.docs;
  }

  List cartlist = [];

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product !')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadimage(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: color1),
            );
          }
          return Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Men's",
                    style: Textsty1,
                  ),
                  Text(
                    'See all',
                    style: TextStyle(color: grecolor),
                  )
                ],
              ),
              SizedBox(
                height: 27.h,
                child: ListView.builder(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    //  snapshot.data[index]['imageURLs']),
                    itemBuilder: ((context, index1) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9.0, vertical: 10),
                          child: Container(
                            width: 38.w,
                            decoration: BoxDecoration(
                                color: wht,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 207, 204, 204),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      blurStyle: BlurStyle.outer,
                                      offset: Offset(1, 2)),
                                ],
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Transform.rotate(
                                    angle: 6.0,
                                    child: Hero(
                                      tag: 'Raheel',
                                      child: InkWell(
                                        onTap: () => setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      ImageDetailsPage(
                                                          imageData: snapshot
                                                              .data[index1]))));
                                        }),
                                        child: Image.network(
                                          snapshot.data[index1]['imageURLs'],
                                          width: 30.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    // onTap: () => addProduct(),
                                    child: Text(
                                      "Mens'Shoes",
                                      style: TextStyle(color: color1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.08.h,
                                  ),
                                  InkWell(
                                    // onTap: () => addProduct(),
                                    child: Text(
                                      snapshot.data[index1]['title'],
                                      style: TextStyle(
                                          color: blk,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.78.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${snapshot.data[index1]['price']}"
                                            .toString(),
                                        style: TextStyle(
                                            color: blk,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.sp),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // data : {
                                          //   'title'
                                          // }
                                          setState(() {
                                            final data = {
                                              'title': snapshot.data[index1],
                                              'price': snapshot.data[index1],
                                              // 'imageURLs':
                                              //     snapshot.data[index1],
                                            };
                                            cartlist.add(data.toString());
                                          });
                                          showSnackbar();
                                        },
                                        child: Container(
                                          height: 3.h,
                                          width: 7.w,
                                          child: Center(
                                              child: Icon(
                                            Icons.add,
                                            color: wht,
                                            size: 5.w,
                                          )),
                                          decoration: BoxDecoration(
                                              color: blk,
                                              borderRadius:
                                                  BorderRadiusDirectional.only(
                                                      bottomEnd:
                                                          Radius.circular(8),
                                                      topStart:
                                                          Radius.circular(8))),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Sales',
                    style: Textsty1,
                  ),
                ],
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
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
                                  color: Color.fromARGB(255, 207, 204, 204),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(1, 2)),
                            ],
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                  snapshot.data[index2]['imageURLs']),
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
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(3),
                                          bottomRight: Radius.circular(3)),
                                      color: color1),
                                  child: Center(
                                      child: Text(
                                    '3%',
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.white),
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
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                      );
                    })),
              )
            ],
          );
        }));
  }
}
