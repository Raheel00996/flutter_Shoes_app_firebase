import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Modal/constant.dart';
import '../authenticatio/Login_Screen.dart';
import '../authenticatio/changepassword.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  bool val = true;

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
  User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: wht,
        body: SingleChildScrollView(
          child: SizedBox(
            height: h1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 9.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        Text(
                          'name',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 19),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h1 * 2 / 24,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: h1 * 2 / 23,
                        width: w1 * 2 / 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage('assets/img (2).jpg'),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: 40,
                        left: 50,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: color1,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: wht,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  StreamBuilder(
                      stream: _products.snapshots(),
                      builder:
                          ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                            children: List.generate(snapshot.data!.docs.length,
                                (index) {
                              final DocumentSnapshot documentSnapshot =
                                  snapshot.data!.docs[index];
                              return Row(
                                children: [
                                  Text(documentSnapshot["name"]),
                                  IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () =>
                                          _update(documentSnapshot)),
                                ],
                              );
                            }),
                          );
                        }
                        return CircularProgressIndicator(
                          color: color1,
                          strokeWidth: 2,
                        );
                      })),
                  Text(
                    '$email',
                    style: text1,
                  ),
                  SizedBox(
                    height: h1 * 2 / 25,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: h1 * 2 / 29,
                      width: w1 * 2 / 2,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 218, 214, 214),
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.payment_rounded,
                              color: color1,
                            ),
                            SizedBox(
                              width: w1 * 2 / 30,
                            ),
                            Text(
                              'Payment Methods',
                              style: text,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h1 * 2 / 80,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: h1 * 2 / 29,
                      width: w1 * 2 / 2,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 218, 214, 214),
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              color: color1,
                            ),
                            SizedBox(
                              width: w1 * 2 / 30,
                            ),
                            Text(
                              'Notification',
                              style: text,
                            ),
                            SizedBox(
                              width: w1 * 2 / 6,
                            ),
                            Switch(
                                activeColor: color1,
                                value: val,
                                onChanged: (value) {
                                  setState(() {
                                    val = value;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h1 * 2 / 80,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const ChangePassword());
                    },
                    child: Container(
                      height: h1 * 2 / 29,
                      width: w1 * 2 / 2,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 218, 214, 214),
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock_outline,
                              color: color1,
                            ),
                            SizedBox(
                              width: w1 * 2 / 30,
                            ),
                            Text(
                              'Change Password',
                              style: text,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h1 * 2 / 80,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: h1 * 2 / 29,
                      width: w1 * 2 / 2,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 218, 214, 214),
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout_rounded,
                              color: color1,
                            ),
                            SizedBox(
                              width: w1 * 2 / 30,
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() async {
                                  await FirebaseAuth.instance.signOut();
                                  Get.to(Login_Screen());
                                });
                              },
                              child: Text(
                                'Logout',
                                style: text,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final double? price =
                        double.tryParse(_priceController.text);
                    if (price != null) {
                      await _products
                          .doc(documentSnapshot!.id)
                          .update({"name": name, "price": price});
                      _nameController.text = '';
                      _priceController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }
}
