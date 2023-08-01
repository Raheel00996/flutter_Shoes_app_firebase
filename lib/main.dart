import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Set HomeScreen as the home screen
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> siteSettings = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final String serverKey = "fa84abdedeb4d8729710da5630db5e4f";
    final String endpoint = "http://demo.wowonder.com/api/get-site-settings";

    final response = await http.get(
      Uri.parse(endpoint),
      headers: {"Authorization": "Bearer $serverKey"},
    );

    if (response.statusCode == 200) {
      setState(() {
        siteSettings = json.decode(response.body);
        ;
      });
    } else {
      throw Exception('Failed to fetch site settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: FutureBuilder(
            future: fetchData(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                  itemCount: siteSettings.length,
                  itemBuilder: ((context, index) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Title: ${siteSettings['title']}'),
                            Text('Description: ${siteSettings['description']}'),
                            // Add more Text widgets or other UI elements to display additional data
                          ])));
            }))
        // child: siteSettings.isEmpty
        //     ? CircularProgressIndicator() // Show a loading indicator while fetching data
        //     :

        );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:ui/Modal/constant.dart';
// import 'package:ui/Screen/home_scree.dart';
// import 'package:ui/authenticatio/Login_Screen.dart';
// import 'package:ui/splash_screen/splash_screen.dart';
// import 'package:ui/storage/localstorage.dart';

// void main() async {
//   await GetStorage.init();
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final Future<bool> isLoggedInFuture = LocalStorage.getLoginState();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: isLoggedInFuture,
//       builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Show a loading screen while checking the login state
//           return MaterialApp(
//             home: Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//           );
//         } else {
//           if (snapshot.hasData && snapshot.data == true) {
//             // User is logged in
//             return GetMaterialApp(
//               title: 'My App',
//               home: home_screen(),
//             );
//           } else {
//             // User is not logged in
//             return GetMaterialApp(
//               title: 'My App',
//               home: Login_Screen(),
//             );
//           }
//         }
//       },
//     );
//   }
// }


{
	"info": {
		"_postman_id": "ed123fa2-649d-4fe9-8514-15a879740ebe",
		"name": "khomos",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
		"_exporter_id": "13573724",
		"_collection_link": "https://planetary-zodiac-973638.postman.co/workspace/New-Team-Workspace~5e133ac4-a01b-4ce9-941b-45e04b2bf4bc/collection/13573724-ed123fa2-649d-4fe9-8514-15a879740ebe?action=share&creator=13573724&source=collection_link"
	},
	"item": [
		{
			"name": "slider",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "http://k.emtiyaz.site/app/apis/slider",
					"protocol": "http",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"slider"
					]
				}
			},
			"response": []
		},
		{
			"name": "login",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						},
						{
							"key": "email",
							"value": "hussaipak@gmail.com",
							"type": "text"
						},
						{
							"key": "password",
							"value": "123123",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "http://k.emtiyaz.site/app/apis/login",
					"protocol": "http",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"login"
					]
				}
			},
			"response": []
		},
		{
			"name": "register",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						},
						{
							"key": "name",
							"value": "zahid",
							"type": "text"
						},
						{
							"key": "email",
							"value": "zahid2@yopmail.com",
							"type": "text"
						},
						{
							"key": "password",
							"value": "123",
							"type": "text"
						},
						{
							"key": "active",
							"value": "1",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/register",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"register"
					]
				}
			},
			"response": []
		},
		{
			"name": "update_user_basic",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "userid",
							"value": "1",
							"type": "text"
						},
						{
							"key": "day",
							"value": "1",
							"type": "text"
						},
						{
							"key": "month",
							"value": "1",
							"type": "text"
						},
						{
							"key": "year",
							"value": "1445",
							"type": "text"
						},
						{
							"key": "last_year_after_khoms_amount",
							"value": "25",
							"type": "text"
						},
						{
							"key": "wakeel",
							"value": "majid",
							"type": "text"
						},
						{
							"key": "loginid",
							"value": "1",
							"type": "text"
						},
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/update_user_basic",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"update_user_basic"
					]
				}
			},
			"response": []
		},
		{
			"name": "khoms_years",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						},
						{
							"key": "userid",
							"value": "1",
							"type": "text"
						},
						{
							"key": "loginid",
							"value": "1",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/khoms_years",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"khoms_years"
					]
				}
			},
			"response": []
		},
		{
			"name": "add_update_khomos",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "userid",
							"value": "1",
							"type": "text"
						},
						{
							"key": "loginid",
							"value": "1",
							"type": "text"
						},
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						},
						{
							"key": "day",
							"value": "",
							"type": "text"
						},
						{
							"key": "month",
							"value": "",
							"type": "text"
						},
						{
							"key": "year",
							"value": "",
							"type": "text"
						},
						{
							"key": "hisab_jari_banki_1",
							"value": "",
							"type": "text"
						},
						{
							"key": "hisab_jari_banki_1_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "hisab_idhar_banki_1",
							"value": "",
							"type": "text"
						},
						{
							"key": "hisab_idhar_banki_1_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "hisab_jari_banki_2",
							"value": "",
							"type": "text"
						},
						{
							"key": "hisab_jari_banki_2_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "wadea_1",
							"value": "",
							"type": "text"
						},
						{
							"key": "wadea_1_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "wadea_2",
							"value": "",
							"type": "text"
						},
						{
							"key": "wadea_2_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "omlah_mahali",
							"value": "",
							"type": "text"
						},
						{
							"key": "omlah_mahali_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "omlah_other_1",
							"value": "",
							"type": "text"
						},
						{
							"key": "omlah_other_1_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "omlah_other_2",
							"value": "",
							"type": "text"
						},
						{
							"key": "omlah_other_2_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "omlah_other_3",
							"value": "",
							"type": "text"
						},
						{
							"key": "omlah_other_3_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "deen_lana",
							"value": "",
							"type": "text"
						},
						{
							"key": "deen_lana_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "deen_alina",
							"value": "",
							"type": "text"
						},
						{
							"key": "deen_alina_amont",
							"value": "",
							"type": "text"
						},
						{
							"key": "ashom_muhafiz_estithmariya_1",
							"value": "",
							"type": "text"
						},
						{
							"key": "ashom_muhafiz_estithmariya_1_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "ashom_muhafiz_estithmariya_2",
							"value": "",
							"type": "text"
						},
						{
							"key": "ashom_muhafiz_estithmariya_2_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "sandeeq_muhafiz_estithmariya_1",
							"value": "",
							"type": "text"
						},
						{
							"key": "sandeeq_muhafiz_estithmariya_1_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "sandeeq_muhafiz_estithmariya_2",
							"value": "",
							"type": "text"
						},
						{
							"key": "sandeeq_muhafiz_estithmariya_2_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "ashom_bedoon_muhafiz_1",
							"value": "",
							"type": "text"
						},
						{
							"key": "ashom_bedoon_muhafiz_1_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "ashom_bedoon_muhafiz_2",
							"value": "",
							"type": "text"
						},
						{
							"key": "ashom_bedoon_muhafiz_2_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "ashom_other",
							"value": "",
							"type": "text"
						},
						{
							"key": "ashom_other_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "zahab_lam_yastamal",
							"value": "",
							"type": "text"
						},
						{
							"key": "zahab_lam_yastamal_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "araz_lam_tastamal",
							"value": "",
							"type": "text"
						},
						{
							"key": "araz_lam_tastamal_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "asya_uhra",
							"value": "",
							"type": "text"
						},
						{
							"key": "asya_uhra_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "haqooq_hidma_amal",
							"value": "",
							"type": "text"
						},
						{
							"key": "haqooq_hidma_amal_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "adhar_man_jiha_amal",
							"value": "",
							"type": "text"
						},
						{
							"key": "adhar_man_jiha_amal_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "wakeel",
							"value": "",
							"type": "text"
						},
						{
							"key": "maazoniah_amount",
							"value": "",
							"type": "text"
						},
						{
							"key": "total",
							"value": "",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/add_update_khoms",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"add_update_khoms"
					]
				}
			},
			"response": []
		},
		{
			"name": "khoms_edit_view",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						},
						{
							"key": "userid",
							"value": "1",
							"type": "text"
						},
						{
							"key": "loginid",
							"value": "1",
							"type": "text"
						},
						{
							"key": "id",
							"value": "1",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/khoms_edit_view",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"khoms_edit_view"
					]
				}
			},
			"response": []
		},
		{
			"name": "user_basic_edit_view",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						},
						{
							"key": "loginid",
							"value": "1",
							"type": "text"
						},
						{
							"key": "userid",
							"value": "1",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/user_basic_edit_view",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"user_basic_edit_view"
					]
				}
			},
			"response": []
		},
		{
			"name": "profile_edit_view",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						},
						{
							"key": "userid",
							"value": "1",
							"type": "text"
						},
						{
							"key": "loginid",
							"value": "1",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/profile_edit_view",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"profile_edit_view"
					]
				}
			},
			"response": []
		},
		{
			"name": "update_profile",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						},
						{
							"key": "userid",
							"value": "1",
							"type": "text"
						},
						{
							"key": "name",
							"value": "hh",
							"type": "text"
						},
						{
							"key": "email",
							"value": "zahid@yopmail.com",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/update_profile",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"update_profile"
					]
				}
			},
			"response": []
		},
		{
			"name": "change_user_password",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						},
						{
							"key": "oldpassword",
							"value": "121131",
							"type": "text"
						},
						{
							"key": "newpassword",
							"value": "123123",
							"type": "text"
						},
						{
							"key": "loginid",
							"value": "1",
							"type": "text"
						},
						{
							"key": "userid",
							"value": "1",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/change_user_password",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"change_user_password"
					]
				}
			},
			"response": []
		},
		{
			"name": "forgot_user_password",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						},
						{
							"key": "email",
							"value": "hussainpak@gmail.com",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/forgot_user_password",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"forgot_user_password"
					]
				}
			},
			"response": []
		},
		{
			"name": "https://k.emtiyaz.site/app/apis/termscondition",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/dropdowns_years",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"dropdowns_years"
					]
				}
			},
			"response": []
		},
		{
			"name": "termscondition",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "secKey",
							"value": "abc",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://k.emtiyaz.site/app/apis/termscondition",
					"protocol": "https",
					"host": [
						"k",
						"emtiyaz",
						"site"
					],
					"path": [
						"app",
						"apis",
						"termscondition"
					]
				}
			},
			"response": []
		}
	]
}