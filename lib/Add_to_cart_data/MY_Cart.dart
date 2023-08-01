import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Modal/constant.dart';
import 'checkout.dart';

class My_Cart extends StatefulWidget {
  const My_Cart({super.key});

  @override
  State<My_Cart> createState() => _My_CartState();
}

class _My_CartState extends State<My_Cart> {
  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
}
// class My_Cart extends StatefulWidget {
//   const My_Cart({
//     super.key,
//     // this.items,
//   });
//   // final dynamic items;
//   @override
//   State<My_Cart> createState() => _My_CartState();
// }

// // AIzaSyCom6WkLVrVjf9cBMBMQQk5ULGwOtPHUZk
// // AIzaSyCom6WkLVrVjf9cBMBMQQk5ULGwOtPHUZk
// class _My_CartState extends State<My_Cart> {
//   @override
//   Widget build(BuildContext context) {
//     double h1 = MediaQuery.of(context).size.height;
//     double w1 = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: wht,
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             'My Cart',
//             style: TextStyle(color: color1, fontWeight: FontWeight.bold),
//           ),
//         ),
//         backgroundColor: wht,
//         elevation: 1000,
//         leading: Icon(
//           Icons.arrow_back_rounded,
//           color: blk,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: h1,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: h1 * 2 / 63,
//                 ),
//                 Container(
//                   height: 60,
//                   width: 360,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(29),
//                       color: Color.fromARGB(255, 246, 228, 217)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.lock,
//                         color: color1,
//                       ),
//                       Text(
//                         '',
//                         style: TextStyle(
//                             color: color1, fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: h1 * 2 / 33,
//                 ),
//                 ListView.builder(
//                     shrinkWrap: true,
//                     controller: ScrollController(),
//                     itemBuilder: (context, index2) {
//                       return Column(
//                         children: [],
//                       );
//                     }),
//                 Column(
//                   children: List.generate(
//                       2,
//                       (index) => Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   color: wht,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: grecolor,
//                                         offset: Offset(1, 2),
//                                         blurRadius: 2)
//                                   ]),
//                               child: ListTile(
//                                 leading: Image.asset(
//                                   'assets/img (4).jpg',
//                                 ),
//                                 title: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     // Text(widget.items.toString()),
//                                     Icon(
//                                       Icons.delete,
//                                       color: color1,
//                                     )
//                                   ],
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Air Max 270',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           '\$290.99',
//                                           style: TextStyle(
//                                               color: blk,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         Row(
//                                           children: [
//                                             IconButton(
//                                                 onPressed: () {},
//                                                 icon: Icon(Icons
//                                                     .remove_circle_outline_rounded)),
//                                             Text('1'),
//                                             IconButton(
//                                                 onPressed: () {},
//                                                 icon: Icon(Icons
//                                                     .add_circle_outline_rounded)),
//                                           ],
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )),
//                 ),
//                 SizedBox(
//                   height: h1 * 2 / 12,
//                 ),
//                 SizedBox(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Items',
//                             style: TextStyle(
//                                 color: grecolor,
//                                 fontSize: 21,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             '\$ 299.99',
//                             style: TextStyle(
//                                 color: blk,
//                                 fontSize: 21,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Discounts',
//                             style: TextStyle(
//                                 color: grecolor,
//                                 fontSize: 21,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             '-\$ 3.0',
//                             style: TextStyle(
//                                 color: blk,
//                                 fontSize: 21,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Divider(),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Total',
//                             style: TextStyle(
//                                 color: grecolor,
//                                 fontSize: 21,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             '-\$ 99.50',
//                             style: TextStyle(
//                                 color: blk,
//                                 fontSize: 21,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: ((context) => Checkout())));
//                         },
//                         child: Container(
//                           height: 60,
//                           width: 360,
//                           decoration: BoxDecoration(
//                               color: color1,
//                               borderRadius: BorderRadius.circular(34)),
//                           child: Center(
//                             child: Text(
//                               'Checkout',
//                               style: TextStyle(
//                                   color: wht,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
