import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:sizer/sizer.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

final bgcolor = Color.fromARGB(255, 64, 5, 90);
// final tex = Colors.white;
// final styl = TextStyle(fontWeight: FontWeight.w800, color: Colors.white);
// final sty = TextStyle(color: Colors.grey[500]);
// final heading1 = TextStyle(
//     fontWeight: FontWeight.w500, color: Colors.white, fontSize: 19.sp);
// final heading2 = TextStyle(fontWeight: FontWeight.w500, color: Colors.white);
// final styl1 = TextStyle(fontWeight: FontWeight.w600, color: Colors.black);
// final sty2 = TextStyle(color: Color.fromARGB(255, 64, 5, 90));
final sty3 = TextStyle(
    color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w400);

final headingtext =
    TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25);
final text1 = TextStyle(
  color: Colors.grey,
);
final color1 = Color.fromARGB(255, 228, 88, 64);
final wht = Colors.white;
final blk = Colors.black;

final grecolor = Colors.grey;
final text2 = TextStyle(
    color: Color.fromARGB(255, 252, 152, 53), fontWeight: FontWeight.bold);
final text = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
final text3 = TextStyle(color: Color.fromARGB(255, 252, 152, 53), fontSize: 12);
final text4 =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black);

List state = [
  {"state": "Pakistan"},
  {"state": "United State"},
  {"state": "Ind"},
];
List City = [
  {"city": "Lahore"},
  {"city": "Islamabad"},
  {"city": "Punjab"},
];

List image = [
  {"images": "assets/images.png"},
  {"images": "assets/uio.png"},
  {"images": "assets/SECOND.png"}
];
List selection = [
  {"images": "assets/second (1).png", "name": "EU"},
  {"images": "assets/second (2).png", "name": "UR"},
  {"images": "assets/second (1).png", "name": "UK"}
];

final sneakers = [
  {
    "name": "Nike",
    "brand": "Air Max 270",
    "price": "\$129.00",
    "im": "assets/second (1).png"
  },
  {
    "name": "Adidas",
    "brand": "Air Force 1",
    "price": "\$119.00",
    "im": "assets/second (2).png"
  },
  {
    "name": "Puma",
    "brand": "Air Max 270",
    "price": "\$129.00",
    "im": "assets/second (1).png"
  },
  {
    "name": "Hummel",
    "brand": "Air Max 270",
    "price": "\$129.00",
    "im": "assets/second (2).png"
  },
  {
    "name": "Reebok",
    "brand": "Air Max 270",
    "price": "\$129.00",
    "im": "assets/second (1).png"
  },
  {
    "name": "Sketcher",
    "brand": "Air Max 270",
    "price": "\$129.00",
    "im": "assets/second (2).png"
  },
];

final Textsty1 = TextStyle(fontWeight: FontWeight.bold, fontSize: 22);
final List<Map<String, String>> img = [
  {"images": "assets/img (5).jpg", "offer": "5%", "price": "\$345.69"},
  {"images": "assets/img (4).jpg", "offer": "3%", "price": "\$135.89"},
  {"images": "assets/img (3).jpg", "offer": "6%", "price": "\$345.99"},
  {"images": "assets/img (5).jpg", "offer": "8%", "price": "\$195.49"},
  {"images": "assets/img (4).jpg", "offer": "2%", "price": "\$135.59"},
  {"images": "assets/img (3).jpg", "offer": "9%", "price": "\$135.99"},
];

var navbaritems = [];

List cartlist = [];
