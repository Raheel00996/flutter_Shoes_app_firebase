import 'package:flutter/material.dart';

import '../Modal/constant.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: wht,
      appBar: AppBar(
        title: Center(
          child: Text(
            'CheckOut',
            style: TextStyle(color: color1, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: wht,
        elevation: 1000,
        leading: Icon(
          Icons.arrow_back_rounded,
          color: blk,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: h1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please confirm and submit your order',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color: blk),
                ),
                SizedBox(
                  height: 40,
                ),
                Text('Add current location', style: text2),
                ExpansionTile(
                    collapsedIconColor: color1,
                    title: Text(
                      'Location',
                    )),
                Text('Credit payment', style: text2),
                ExpansionTile(
                  collapsedIconColor: color1,
                  title: Text(
                    'Payment',
                  ),
                  children: [
                    Form(
                        child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: wht, boxShadow: [
                            BoxShadow(
                                color: grecolor,
                                offset: Offset(1, 2),
                                blurRadius: 2,
                                spreadRadius: 2)
                          ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name on card',
                                style: text,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Enter your name',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Card number',
                                style: text,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: '**** **** **** ****',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Expiration date',
                                        style: text,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 160,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              hintText: 'MM/YY',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Security code',
                                        style: text,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 160,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              hintText: 'CVC',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
                Text('Payment on delivery', style: text2),
                ExpansionTile(
                  collapsedIconColor: color1,
                  title: Text(
                    'Payment',
                  ),
                ),
                Text('Add shipping address', style: text2),
                ExpansionTile(
                  collapsedIconColor: color1,
                  title: Text(
                    'Address',
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Full Name',
                          style: text,
                        ),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color1),
                                ),
                                hintText: 'Full Name',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color1),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mobile Number',
                          style: text,
                        ),
                        SizedBox(
                          width: 200,
                          // height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color1),
                                ),
                                hintText: 'Mobile Number',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color1),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'State',
                          style: text,
                        ),
                        SizedBox(
                          width: 150,
                          child: DropdownButtonFormField(
                              hint: Text('State'),
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color1))),
                              iconEnabledColor: color1,
                              focusColor: color1,
                              items: const [
                                DropdownMenuItem(
                                  value: 1,
                                  enabled: true,
                                  child: Text('Pakistan'),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  enabled: false,
                                  child: Text('United State'),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  enabled: false,
                                  child: Text('India'),
                                ),
                              ],
                              onChanged: (v) {}),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'City',
                          style: text,
                        ),
                        SizedBox(
                          width: 150,
                          child: DropdownButtonFormField(
                              hint: Text('City'),
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color1))),
                              iconEnabledColor: color1,
                              focusColor: color1,
                              items: const [
                                DropdownMenuItem(
                                  value: 1,
                                  enabled: true,
                                  child: Text('Lahore'),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  enabled: false,
                                  child: Text('Punjab'),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  enabled: false,
                                  child: Text('Islamabad'),
                                ),
                              ],
                              onChanged: (v) {}),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Street (include house number)',
                          style: text,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: color1),
                              ),
                              hintText: 'Street',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: color1),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Checkout())));
                  },
                  child: Container(
                    height: 60,
                    width: 360,
                    decoration: BoxDecoration(
                        color: color1, borderRadius: BorderRadius.circular(34)),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: wht,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
