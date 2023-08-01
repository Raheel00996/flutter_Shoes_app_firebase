import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ui/catagoris/all_brands.dart';

import '../Add_to_cart_data/MY_Cart.dart';
import '../Modal/constant.dart';

class Nike extends StatefulWidget {
  const Nike({Key? key}) : super(key: key);

  @override
  State<Nike> createState() => _NikeState();
}

class _NikeState extends State<Nike> {
  bool isLoading = false;

  Future loadImages() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    return snapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadImages(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: color1),
          );
        }
        return GridView.builder(
          shrinkWrap: true,
          controller: ScrollController(),
          itemCount: snapshot.data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 220,
            crossAxisSpacing: 3,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 9.0, vertical: 10),
              child: InkWell(
                onTap: () {
                  // setState(() {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: ((context) => ImageDetailsPage(
                  //         imageData: snapshot.data[index1],
                  //       )),
                  //     ),
                  //   );
                  // });
                },
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
                        offset: Offset(1, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.h),
                        Transform.rotate(
                          angle: 6.0,
                          child: Hero(
                            tag: 'Raheel',
                            child: Image.network(
                              snapshot.data[index]['imageURLs'],
                              width: 30.w,
                            ),
                          ),
                        ),
                        Text(
                          "Men's Shoes",
                          style: TextStyle(color: color1),
                        ),
                        SizedBox(height: 0.08.h),
                        Text(
                          snapshot.data[index]['title'],
                          style: TextStyle(
                              color: blk, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 1.78.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${snapshot.data[index]['price']}"
                                  .toUpperCase(),
                              style: TextStyle(
                                color: blk,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            ),
                            Container(
                              height: 3.h,
                              width: 7.w,
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: wht,
                                  size: 5.w,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: blk,
                                borderRadius: BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(8),
                                  topStart: Radius.circular(8),
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
