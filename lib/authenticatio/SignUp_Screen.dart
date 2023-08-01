import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ui/Screen/home_scree.dart';

import '../Modal/constant.dart';
import 'Login_Screen.dart';
import 'package:get/get.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  bool ischecked = false;
  bool isLoading = false;

  final _formkey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  var confirmPassword = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  registration() async {
    setState(() {
      isLoading = true;
    });
    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);
        Get.snackbar('Unknown', 'Login Successfull', backgroundColor: color1);

        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => home_screen())));
      } on FirebaseAuthException catch (e) {
        String title = e.code.replaceAll(RegExp('_'), '').capitalize!;
        String message = '';
        if (e.code == 'week-password') {
          message = 'The password provided is too week';
        } else if (e.code == 'email-already-in0use') {
          message = 'the account already existe';
        } else {
          message = e.message.toString();
        }
        Get.snackbar(title, message);
      } catch (e) {
        Get.snackbar('Error occured', e.toString(), backgroundColor: color1);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('user');

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h1 * 2 / 50,
              ),
              Center(
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              Get.to(() => const Login_Screen());
                            });
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            size: 33,
                          ),
                        )),
                    SizedBox(
                      width: w1 * 2 / 12,
                    ),
                    Text(
                      'Sign Up Now',
                      style: headingtext,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h1 * 2 / 600,
              ),
              Container(
                height: 4,
                width: 100,
                color: color1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'please sign up to continue using our app',
                  style: text1,
                ),
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: h1 * 2 / 50,
                      ),
                      Container(
                        height: 47,
                        width: 340,
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              prefixIcon: Icon(
                                Icons.person_2_rounded,
                                color: Colors.grey,
                                size: 20,
                              ),
                              hintText: 'Full Name',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                      SizedBox(
                        height: h1 * 2 / 80,
                      ),
                      Container(
                        height: 47,
                        width: 340,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: Colors.grey,
                                size: 20,
                              ),
                              hintText: 'Email Address',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                      SizedBox(
                        height: h1 * 2 / 80,
                      ),
                      Container(
                        height: 47,
                        width: 340,
                        child: TextFormField(
                          controller: _priceController,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              prefixIcon: Icon(
                                Icons.local_phone_rounded,
                                color: Colors.grey,
                                size: 20,
                              ),
                              hintText: 'phone number',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                      SizedBox(
                        height: h1 * 2 / 80,
                      ),
                      Container(
                        height: 47,
                        width: 340,
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.fingerprint_rounded,
                                color: Colors.grey,
                                size: 20,
                              ),
                              hintText: 'Password',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                      SizedBox(
                        height: h1 * 2 / 80,
                      ),
                      Container(
                        height: 47,
                        width: 340,
                        child: TextFormField(
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.fingerprint_rounded,
                                color: Colors.grey,
                                size: 20,
                              ),
                              hintText: 'Confirm Password',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: h1 * 2 / 220,
              ),
              Row(
                children: [
                  Checkbox(
                      //activeColor: Colors.amber,
                      activeColor: Colors.white,
                      checkColor: color1,
                      focusColor: color1,
                      side: BorderSide(color: color1, width: 2),
                      value: ischecked,
                      onChanged: (val) {
                        setState(() {
                          ischecked = val!;
                        });
                      }),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(text: 'I agree to the ', style: text1),
                    TextSpan(
                        text: 'Terms',
                        style: TextStyle(
                            color: color1, fontWeight: FontWeight.bold)),
                    TextSpan(text: ' and ', style: text1),
                    TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: color1))
                  ])),
                ],
              ),
              SizedBox(
                height: h1 * 2 / 90,
              ),
              isLoading
                  ? CircularProgressIndicator(
                      color: color1,
                    )
                  : ischecked
                      ? InkWell(
                          onTap: () async {
                            final String name = _nameController.text;
                            final double? price =
                                double.tryParse(_priceController.text);
                            if (price != null) {
                              await _products
                                  .add({"name": name, "price": price});

                              _nameController.text = '';
                              _priceController.text = '';
                            }
                            setState(() {
                              email = emailController.text;
                              password = passwordController.text;
                              confirmPassword = confirmPasswordController.text;
                              registration();
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 340,
                            decoration: BoxDecoration(
                                color: color1,
                                borderRadius: BorderRadius.circular(9)),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 50,
                          width: 340,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 196, 197, 194),
                              borderRadius: BorderRadius.circular(9)),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
              SizedBox(
                height: h1 * 2 / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: Colors.grey[300],
                    height: 2,
                    width: 140,
                  ),
                  Text(
                    'OR',
                    style:
                        TextStyle(color: grecolor, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    color: Colors.grey[300],
                    height: 2,
                    width: 140,
                  ),
                ],
              ),
              SizedBox(
                height: h1 * 2 / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      height: 55,
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(9)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images.png',
                            width: 40,
                          ),
                          Text(
                            'Facebook',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 19),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      height: 55,
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(9)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/uio.png',
                            width: 40,
                          ),
                          Text(
                            'Google',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 19),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h1 * 2 / 73,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'By signing up you accept the ', style: text1),
                TextSpan(
                    text: 'Terms of',
                    style:
                        TextStyle(color: color1, fontWeight: FontWeight.bold))
              ])),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Service',
                    style:
                        TextStyle(color: color1, fontWeight: FontWeight.bold)),
                TextSpan(text: ' and ', style: text1),
                TextSpan(
                    text: 'Privacy policy',
                    style:
                        TextStyle(color: color1, fontWeight: FontWeight.bold)),
              ])),
              // SizedBox(
              //   height: h1 * 2 / 53,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ?",
                    style: text1,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          Get.to(() => const Login_Screen());
                        });
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: color1, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
