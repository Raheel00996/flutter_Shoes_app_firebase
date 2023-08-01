    // height: 2.h,
    //                                   ),
    //                                   Text(
    //                                     'Choose Color',
    //                                     style: TextStyle(
    //                                         fontSize: 14.sp,
    //                                         fontWeight: FontWeight.bold),
    //                                   ),
    //                                   SizedBox(
    //                                     height: 2.h,
    //                                   ),
    //                                   Row(
    //                                       children: List.generate(
    //                                           snapshot
    //                                               .data[index]['mainImageURL']
    //                                               .length,
    //                                           (index2) => Padding(
    //                                                 padding: const EdgeInsets
    //                                                         .symmetric(
    //                                                     horizontal: 8.0),
    //                                                 child: Stack(
    //                                                   children: [
    //                                                     Container(
    //                                                       height: 7.h,
    //                                                       width: 18.w,
    //                                                       decoration: BoxDecoration(
    //                                                           image: DecorationImage(
    //                                                               image: NetworkImage(snapshot
    //                                                                           .data[index]
    //                                                                       ['mainImageURL']
    //                                                                   [index2]),
    //                                                               fit: BoxFit
    //                                                                   .cover),
    //                                                           border: Border.all(
    //                                                               color: Colors
    //                                                                   .amber,
    //                                                               width: 4),
    //                                                           borderRadius:
    //                                                               BorderRadius
    //                                                                   .circular(
    //                                                                       15)),
    //                                                     ),
    //                                                     Positioned(
    //                                                       left: 0,
    //                                                       top: -10,
    //                                                       right: 90,
    //                                                       bottom: 300,
    //                                                       child: IconButton(
    //                                                           onPressed:
    //                                                               () async {
    //                                                             await delete(
    //                                                               snapshot.data[
    //                                                                       index]
    //                                                                   ['size'],
    //                                                               snapshot.data[
    //                                                                           index]
    //                                                                       [
    //                                                                       'secondimage']
    //                                                                   [index2],
    //                                                             );
    //                                                             ScaffoldMessenger.of(
    //                                                                     context)
    //                                                                 .showSnackBar(SnackBar(
    //                                                                     backgroundColor:
    //                                                                         Colors
    //                                                                             .amber,
    //                                                                     content:
    //                                                                         Text('Image delete succefull')));
    //                                                           },
    //                                                           icon: Icon(
    //                                                             Icons
    //                                                                 .highlight_remove_outlined,
    //                                                             size: 20,
    //                                                             color:
    //                                                                 Colors.red,
    //                                                           )),
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                               ))),
    //                                   SizedBox(
    //                                     height: 2.h,
    //                                   ),
    //                                   Text(
    //                                     'Select Size',
    //                                     style: TextStyle(
    //                                         fontSize: 14.sp,
    //                                         fontWeight: FontWeight.bold),
    //                                   ),
    //                                   SizedBox(
    //                                     height: 2.h,
    //                                   ),
    //                                   GridView.builder(
    //                                       shrinkWrap: true,
    //                                       controller: ScrollController(),
    //                                       itemCount: snapshot
    //                                           .data[index]['size'].length,
    //                                       gridDelegate:
    //                                           SliverGridDelegateWithFixedCrossAxisCount(
    //                                               crossAxisCount: 6,
    //                                               mainAxisSpacing: 10),
    //                                       itemBuilder: ((context, index3) =>
    //                                           Padding(
    //                                             padding:
    //                                                 const EdgeInsets.symmetric(
    //                                                     horizontal: 8),
    //                                             child: Container(
    //                                               height: 1.h,
    //                                               width: 5.w,
    //                                               child: Center(
    //                                                   child: Text(
    //                                                 snapshot.data[index]['size']
    //                                                     [index3],
    //                                                 style: Theme.of(context)
    //                                                     .textTheme
    //                                                     .bodyLarge,
    //                                               )),
    //                                               decora