import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';

import 'package:ui/Screen/home_scree.dart';
import 'package:get/get.dart';

import '../Modal/constant.dart';
import '../storage/localstorage.dart';
import 'Change_Email.dart';
import 'Google_Signin.dart';
import 'SignUp_Screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  bool ischecked = false;
  bool isLoading = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await LocalStorage.saveLoginState(true);
      Get.offAll(home_screen());
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('_'), '').capitalize!;
      String message = '';
      if (e.code == 'week-password') {
        message = 'email is wron';
      } else if (e.code == 'email-already-in0use') {
        message = 'the account already existe';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message, backgroundColor: color1);
    } catch (e) {
      Get.snackbar('Error occured', e.toString(), backgroundColor: color1);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Create an instance of the firebase auth and google signin
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    //Triger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    //Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    //Create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //Sign in the user with the credentials
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
    return null;
  }
//internet activity
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   startstriming();
  // }

  // late ConnectivityResult result;
  // late StreamSubscription subscription;
  // var isconected = false;
  // checkinternet() async {
  //   result = await Connectivity().checkConnectivity();
  //   if (result != ConnectivityResult.none) {
  //     isconected = true;
  //   } else {
  //     isconected = false;
  //     showdialog();
  //   }
  //   setState(() {
  //     Navigator.pop(context);
  //     checkinternet();
  //   });
  // }

  // showdialog() {
  //   showDialog(
  //       context: context,
  //       builder: ((context) => CupertinoAlertDialog(
  //             title: Text('No internet'),
  //             content: Text('please check internet'),
  //             actions: [ElevatedButton(onPressed: () {}, child: Text('try'))],
  //           )));
  // }

  // startstriming() {
  //   subscription = Connectivity().onConnectivityChanged.listen((event) async {
  //     checkinternet();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;

    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
            child: Column(
              children: [
                SizedBox(
                  height: h1 * 2 / 20,
                ),
                Center(
                  child: Text(
                    'Sign In Now',
                    style: headingtext,
                  ),
                ),
                SizedBox(
                  height: h1 * 2 / 90,
                ),
                Container(
                  height: 4,
                  width: 100,
                  color: color1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'please sign in to continue using our app',
                    style: text1,
                  ),
                ),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: h1 * 2 / 30,
                        ),
                        Container(
                          height: 6.h,
                          width: 340,
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              } else if (!value.contains('@')) {
                                return 'Please Enter Valid Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                hintText: 'Email Address',
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 14),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.grey)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                          ),
                        ),
                        SizedBox(
                          height: h1 * 2 / 40,
                        ),
                        Container(
                          height: 6.h,
                          width: 340,
                          child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                            obscureText: true,
                            autofocus: false,
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.fingerprint_rounded,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_outlined,
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
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: h1 * 2 / 70,
                ),
                Row(
                  children: [
                    Checkbox(
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
                    Text(
                      'Remember Me',
                      style: text1,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(ChangeEmail());
                        },
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                              color: color1, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                SizedBox(
                  height: h1 * 2 / 30,
                ),
                isLoading
                    ? CircularProgressIndicator(
                        color: color1,
                      )
                    : ischecked
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                email = emailController.text;
                                password = passwordController.text;

                                userLogin();
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 340,
                              decoration: BoxDecoration(
                                  color: color1,
                                  borderRadius: BorderRadius.circular(9)),
                              child: const Center(
                                child: Text(
                                  'Sign In',
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
                            child: const Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                SizedBox(
                  height: h1 * 2 / 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.grey[300],
                      height: 2,
                      width: 150,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                          color: grecolor, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      color: Colors.grey[300],
                      height: 2,
                      width: 150,
                    ),
                  ],
                ),
                SizedBox(
                  height: h1 * 2 / 30,
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
                        width: 156,
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
                      child: Container(
                        height: 55,
                        width: 166,
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
                  height: h1 * 2 / 53,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont' have an account ?",
                      style: text1,
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            Get.to(() => const Sign_up());
                          });
                        },
                        child: Text(
                          'Sign Up',
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
    });
  }
}
