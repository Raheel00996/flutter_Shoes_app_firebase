import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authenticatio/Login_Screen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () => Get.to(Login_Screen()));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                tileMode: TileMode.mirror,
                stops: [0.55, 0.9],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(1),
                  const Color(0xffE35239).withOpacity(1)
                ])),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              'assets/rt.png',
              width: 800,
            ),
            const SizedBox(
              height: 70,
            ),
            const Text(
              'LIVE YOUR ',
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'PERFECT',
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Smart, gorgeous & fashionable',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 209, 197, 197),
              ),
            ),
            const Text(
              'collection makes you cool',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 209, 197, 197),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            const CircularProgressIndicator(
              color: Colors.black,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Get Started',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Login_Screen extends StatelessWidget {
//   const Login_Screen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 90,
//             ),
//             Center(child: Image.asset('assets/chatgpt.png')),
//             Form(
//                 child: Column(children: [
//               Container(
//                 height: 420,
//                 width: 300,
//                 decoration: BoxDecoration(),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 40,
//                     ), '),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     input_field(),
//                   ],
//                 ),
//               )
//             ]))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class input_field extends StatelessWidget {
//   final hint;

//   const input_field({
//     super.key,
//     this.hint = 'Email',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//           label: Text(hint),
//           hintText: 'Enter Email',
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//           enabledBorder:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(17))),
//     );
//   }
// }
