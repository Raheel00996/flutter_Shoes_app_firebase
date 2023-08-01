import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/Modal/constant.dart';

import 'package:ui/authenticatio/Login_Screen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  var newPassword = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  final newPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  changePassword() async {
    setState(() {
      isLoding = true;
    });
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login_Screen()),
      );

      Get.snackbar('title', 'Your password has been changes,!again Login',
          backgroundColor: color1);
    } catch (e) {
      Get.snackbar('Error', 'Password should be at least 6 chracter',
          backgroundColor: color1);
    }
    setState(() {
      isLoding = false;
    });
  }

  bool ischeked = false;
  bool isLoding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.to(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: blk,
          ),
        ),
        backgroundColor: wht,
        title: Text(
          "Change Password",
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
            'assets/changepasssword.png',
            width: 65.w,
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              'Enter New Password',
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
                        controller: newPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
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
                            hintText: 'Change Password',
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
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1 / 1,
                            child: CircularProgressIndicator(
                              color: color1,
                            ))
                        : ischeked
                            ? InkWell(
                                onTap: () {
                                  // Validate returns true if the form is valid, otherwise false.
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      newPassword = newPasswordController.text;
                                      changePassword();
                                    });
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
                                      'Change Password',
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
                                    'Change Password',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // body: Column(
    //   children: [
    //     Form(
    //       key: _formKey,
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    //         child: ListView(
    //           children: [
    //             Container(
    //               margin: EdgeInsets.symmetric(vertical: 10.0),
    //               child: TextFormField(
    //                 autofocus: false,
    //                 obscureText: true,
    //                 decoration: InputDecoration(
    //                   labelText: 'New Password: ',
    //                   hintText: 'Enter New Password',
    //                   labelStyle: TextStyle(fontSize: 20.0),
    //                   border: OutlineInputBorder(),
    //                   errorStyle:
    //                       TextStyle(color: Colors.redAccent, fontSize: 15),
    //                 ),
    //                 controller: newPasswordController,
    //                 validator: (value) {
    //                   if (value == null || value.isEmpty) {
    //                     return 'Please Enter Password';
    //                   }
    //                   return null;
    //                 },
    //               ),
    //             ),
    //             ElevatedButton(
    //               onPressed: () {
    //                 // Validate returns true if the form is valid, otherwise false.
    //                 if (_formKey.currentState!.validate()) {
    //                   setState(() {
    //                     newPassword = newPasswordController.text;
    //                   });
    //                   changePassword();
    //                 }
    //               },
    //               child: Text(
    //                 'Change Password',
    //                 style: TextStyle(fontSize: 18.0),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
  }
}
// class ChangePassword extends StatefulWidget {
//   ChangePassword({Key? key}) : super(key: key);

 
//   _ChangePasswordState createState() => _ChangePasswordState();
// }

// class _ChangePasswordState extends State<ChangePassword> {


//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
