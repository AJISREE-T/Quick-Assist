import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.orange[800],
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: Icon(
      //       Icons.line_weight,
      //       color: Colors.white,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(
      //         Icons.notifications,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ],
      // ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(children: [
            TextFormField(
              style: TextStyle(
                height: 1.0,
              ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15, 8, 80, 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    size: 28,
                    color: Colors.orange[800],
                  ),
                  hintText: "Location, Shop name"),
            ),
            SizedBox(
              height: 30,
            ),


            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.orange,width: 1.5),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),

                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 80,
                                width: 80,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage('assets/image/mech2.jpg'),

                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 10, bottom: 10),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ram mechanic shop",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,size: 20,),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'perinthalmanna',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height:5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star_border_outlined,color: Colors.yellow,),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30,top: 6),
                        height:60 ,
                        width: 340,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange,width: 1.5),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),


                        ),
                        child: Row(

                          children: [
                            Column(
                              children: [
                                InkWell(
                                    onTap: () async{


                                      launch("tel:+916282485662");


                                    },
                                    child: Icon(Icons.phone,color: Colors.black54,)),
                                Text('call',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange[800]),)
                              ],
                            ),
                            SizedBox(width: 50,),
                            Divider(),
                            Column(
                              children: [
                                Icon(Icons.directions,color: Colors.black54,),
                                Text('Direction',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange[800]),)
                              ],
                            ),
                            SizedBox(width: 50,),
                            Divider(),
                            Column(
                              children: [
                                Icon(Icons.book,color: Colors.black54,),
                                Text('Book Now',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange[800]),)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25,),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.orange,width: 1.5),

                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),

                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 80,
                                width: 80,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage('assets/image/mech2.jpg'),

                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 10, bottom: 10),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Work shop",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,size: 20,),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Angadippuram',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height:5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star_border_outlined,color: Colors.yellow,),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30,top: 6),
                        height:60 ,
                        width: 340,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange,width: 1.3),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),


                        ),
                        child: Row(

                          children: [
                            Column(
                              children: [
                                Icon(Icons.phone,color: Colors.black54,),
                                Text('call',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange[800]),)
                              ],
                            ),
                            SizedBox(width: 50,),
                            Divider(),
                            Column(
                              children: [
                                Icon(Icons.directions,color: Colors.black54,),
                                Text('Direction',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange[800]),)
                              ],
                            ),
                            SizedBox(width: 50,),
                            Divider(),
                            Column(
                              children: [
                                Icon(Icons.book,color: Colors.black54,),
                                Text('Book Now',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange[800]),)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25,),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.orange,width: 1.5),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),

                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 80,
                                width: 80,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage('assets/image/mech2.jpg'),

                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 10, bottom: 10),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ram mechanic shop",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,size: 20,),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'perinthalmanna',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height:5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star_border_outlined,color: Colors.yellow,),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30,top: 6),
                        height:60 ,
                        width: 340,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange,width: 1.5),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),


                        ),
                        child: Row(

                          children: [
                            Column(
                              children: [
                                InkWell(
                                    onTap: () async{


                                      launch("tel:+916282485662");


                                    },
                                    child: Icon(Icons.phone,color: Colors.black54,)),
                                Text('call',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange[800]),)
                              ],
                            ),
                            SizedBox(width: 50,),
                            Divider(),
                            Column(
                              children: [
                                Icon(Icons.directions,color: Colors.black54,),
                                Text('Direction',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange[800]),)
                              ],
                            ),
                            SizedBox(width: 50,),
                            Divider(),
                            Column(
                              children: [
                                Icon(Icons.book,color: Colors.black54,),
                                Text('Book Now',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange[800]),)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),


                ],
              ),
            )
          ]),
        ),
      ),



    );
  }
}
