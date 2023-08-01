import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui/catagoris/all_brands.dart';
import '../Add_to_cart_data/MY_Cart.dart';
import 'package:ui/catagoris/Nike.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Modal/constant.dart';
import 'package:sizer/sizer.dart';

class test2 extends StatefulWidget {
  test2({super.key});

  @override
  State<test2> createState() => _test2State();
}

class _test2State extends State<test2> with TickerProviderStateMixin {
  final bgwhite = Colors.white;

  final bgblack = Colors.black;

  final selctedindex = 0;

  int tabindex = 0;

  late TabController _tabController;

  final pages = [
    const All_Brands(),
    const Nike(),
    const Nike(),
    const Nike(),
    const Nike(),
    const Nike(),
    const Nike(),
    const Nike(),
    const Nike(),
    const Nike(),
    const Nike(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 11, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int ind = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 240,
                  height: 47,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search_sharp),
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(22))),
                  ),
                ),
                Stack(children: [
                  Positioned(
                    child: IconButton(
                        onPressed: () {
                          Get.to(My_Cart());
                        },
                        icon: const Icon(Icons.shopping_cart_rounded)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30, top: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 5,
                    ),
                  )
                ])
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  'Shoes',
                  style: Textsty1,
                ),
              ],
            ),
            SizedBox(
                height: 50,
                child: DefaultTabController(
                  length: 11,
                  child: TabBar(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.all(4),
                      automaticIndicatorColorAdjustment: false,
                      indicatorColor: Colors.transparent,
                      labelColor: Color.fromARGB(255, 228, 227, 225),
                      controller: _tabController,
                      isScrollable: true,
                      unselectedLabelColor: Colors.black,
                      onTap: (value) {
                        setState(() {
                          ind = value;
                        });
                      },
                      labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                      tabs: [
                        Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromARGB(255, 191, 189, 189),
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16.w),
                              color: ind == 0 ? color1 : Colors.transparent),
                          child: const Tab(
                            text: 'All',
                          ),
                        ),
                        Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromARGB(255, 191, 189, 189),
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16.w),
                              color: ind == 1 ? color1 : Colors.transparent),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                    'assets/addidas.jpg',
                                  ),
                                ),
                              ),
                              const Tab(
                                text: 'Nike',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromARGB(255, 191, 189, 189),
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16.w),
                              color: ind == 2 ? color1 : Colors.transparent),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/addidas.jpg'),
                                ),
                              ),
                              const Tab(
                                text: 'Addidas',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromARGB(255, 191, 189, 189),
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16.w),
                              color: ind == 3 ? color1 : Colors.transparent),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/Relaxo.png'),
                                ),
                              ),
                              const Tab(
                                text: 'Relaxo',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromARGB(255, 191, 189, 189),
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16.w),
                              color: ind == 4 ? color1 : Colors.transparent),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/sneaker1.png'),
                                ),
                              ),
                              const Tab(
                                text: 'Sneaker',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromARGB(255, 191, 189, 189),
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16.w),
                              color: ind == 5 ? color1 : Colors.transparent),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/paragon.png'),
                                ),
                              ),
                              const Tab(
                                text: 'Paragon',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromARGB(255, 191, 189, 189),
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16.w),
                              color: ind == 6 ? color1 : Colors.transparent),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/lancer3.png'),
                                ),
                              ),
                              const Tab(
                                text: 'Lancer',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromARGB(255, 191, 189, 189),
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16.w),
                              color: ind == 7 ? color1 : Colors.transparent),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/ABINITIO.png'),
                                ),
                              ),
                              const Tab(
                                text: 'Abinitio',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromARGB(255, 191, 189, 189),
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16.w),
                              color: ind == 8 ? color1 : Colors.transparent),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/sanlong.png'),
                                ),
                              ),
                              const Tab(
                                text: 'Sanlong',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromARGB(255, 191, 189, 189),
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16.w),
                              color: ind == 9 ? color1 : Colors.transparent),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/Tirumala.png'),
                                ),
                              ),
                              const Tab(
                                text: 'Tirumala',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 43,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromARGB(255, 191, 189, 189),
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(16.w),
                              color: ind == 10 ? color1 : Colors.transparent),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/hitz1.png'),
                                ),
                              ),
                              const Tab(
                                text: 'Hitz',
                              ),
                            ],
                          ),
                        )
                      ]),
                )),
            SizedBox(
              height: 800,
              child: TabBarView(controller: _tabController, children: pages),
            ),
          ]),
        ),
      ),
    );
  }
}

class tab3 extends StatelessWidget {
  const tab3({super.key});

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        SizedBox(
          height: 900,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9.0),
            child: GridView.builder(
                shrinkWrap: true,
                controller: ScrollController(),
                itemCount: sneakers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 200,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 25,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => Container(
                      width: 300,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 217, 214, 214),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2)),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Transform.translate(
                            offset: const Offset(15, -20),
                            child: Transform.scale(
                              scale: 2,
                              child: Image.asset(
                                sneakers[index]['im']!,
                                width: 300,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(sneakers[index]['brand']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    sneakers[index]['price']!,
                                    style: text1,
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: color1,
                                child: const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
          ),
        )
      ],
    );
  }
}

class tab4 extends StatelessWidget {
  const tab4({super.key});

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        SizedBox(
          height: 900,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9.0),
            child: GridView.builder(
                itemCount: sneakers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 190,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 25,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => Container(
                      width: 300,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 217, 214, 214),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2)),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Transform.translate(
                            offset: const Offset(15, -20),
                            child: Transform.scale(
                              scale: 2,
                              child: Image.asset(
                                sneakers[index]['im']!,
                                width: 300,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(sneakers[index]['brand']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    sneakers[index]['price']!,
                                    style: text1,
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: color1,
                                child: const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
          ),
        )
      ],
    );
  }
}

class tab5 extends StatelessWidget {
  const tab5({super.key});

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        SizedBox(
          height: 900,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9.0),
            child: GridView.builder(
                itemCount: sneakers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 190,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => Container(
                      width: 300,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 217, 214, 214),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2)),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            sneakers[index]['im']!,
                            width: 300,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(sneakers[index]['brand']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    sneakers[index]['price']!,
                                    style: text1,
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: color1,
                                child: const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
          ),
        )
      ],
    );
  }
}

class tab6 extends StatelessWidget {
  const tab6({super.key});

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        SizedBox(
          height: 900,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9.0),
            child: GridView.builder(
                itemCount: sneakers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 190,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => Container(
                      width: 300,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 217, 214, 214),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2)),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            sneakers[index]['im']!,
                            width: 300,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(sneakers[index]['brand']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    sneakers[index]['price']!,
                                    style: text1,
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: color1,
                                child: const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
          ),
        )
      ],
    );
  }
}
