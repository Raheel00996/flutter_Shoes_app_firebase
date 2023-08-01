import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ui/authenticatio/Login_Screen.dart';

import 'package:sizer/sizer.dart';

import '../Modal/constant.dart';

class ChangeEmail extends StatefulWidget {
  ChangeEmail({Key? key}) : super(key: key);

  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      setState(() {
        isLoding = true;
      });
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar(
          backgroundColor: color1, 'Password email is sent!', 'Unknown');

      setState(() {
        isLoding = false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar('Error occured', e.toString(), backgroundColor: color1);
      }
    }
  }

  bool ischeked = false;
  bool isLoding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_rounded,
          color: blk,
        ),
        backgroundColor: wht,
        title: Text(
          "Reset Password",
          style: headingtext,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Image.asset(
            'assets/email.png',
            width: 65.w,
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              'Reset Link will be sent to your email id !',
              style: TextStyle(fontSize: 13.sp, color: color1),
            ),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      height: 9.h,
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
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.white,
                            checkColor: color1,
                            focusColor: color1,
                            side: BorderSide(color: color1, width: 2),
                            value: ischeked,
                            onChanged: (val) {
                              setState(() {
                                ischeked = val!;
                              });
                            }),
                        Text(
                          'Remember Me',
                          style: text1,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    isLoding
                        ? CircularProgressIndicator(
                            strokeWidth: 2,
                            color: color1,
                          )
                        : ischeked
                            ? InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      email = emailController.text;
                                    });
                                    resetPassword();
                                  }
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
                    SizedBox(height: 5.h),
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do not have an account ?",
                          style: text1,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Get.to(() => const Login_Screen());
                              });
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: color1, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
