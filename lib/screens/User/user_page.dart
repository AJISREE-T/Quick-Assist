import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickassist/screens/User/booking_service.dart';
import 'package:url_launcher/url_launcher.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final CollectionReference users =
  FirebaseFirestore.instance.collection('users');
  // int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child:  SingleChildScrollView(
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
            height: 20,
          ),
          Container(
            height: 170,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage('assets/image/car5.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Vehicle Type',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/carrm.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Text(
                      'Car',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage('assets/image/heavy vehiclerm.png'),
                            // fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Heavy Vehicle',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/bikes-rm.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Text(
                      'Motor Bike',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    CircleAvatar(
                        radius: 35,
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/image/scootyrm.png'),
                            ),
                          ),
                        )),
                    Text(
                      'Scooty',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w600,color: Colors.black87),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),

              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Recommanded shops',
                style:
                TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),Expanded(child:Container() ),
              Text(
                'see all',
                style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black54),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),


          Container(
            height: 300,

            child: StreamBuilder(
              stream:users.where('role',isEqualTo: "Shop").snapshots(),
              builder: (context,AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot usersSnap=snapshot.data.docs[index];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                height: 100,
                                width: 290,
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
                                              usersSnap['name'],
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
                                                  usersSnap['address'],
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
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                padding: EdgeInsets.only(left: 30,top: 6),
                                height:60 ,
                                width: 290,
                                decoration: BoxDecoration(
                                  color: Colors.orange[800],
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),

                                ),
                                child: Row(

                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                            onTap: (){
                                              usersSnap[launch("tel:+916282485662")];
                                            },
                                            child: Icon(Icons.phone,color: Colors.black,)),
                                        Text('call',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                                      ],
                                    ),
                                    SizedBox(width: 50,),
                                    Divider(),
                                    Column(
                                      children: [
                                        Icon(Icons.directions,color: Colors.black,),
                                        Text('Direction',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                                      ],
                                    ),
                                    SizedBox(width: 50,),
                                    Divider(),
                                    Column(
                                      children: [
                                        Icon(Icons.book,color: Colors.black,),
                                        InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingServidce()));
                                            },
                                            child: Text('Book Now',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))
                                      ],
                                    ),
                                  ],
                                ),


                              ),
                            ),

                            SizedBox(width: 20,),

                          ],
                        );


                      },),

                  );

                }
                return Container();

              },
            ),
          ),
          SizedBox(width: 20,),



        ]),
      ),



    );
  }
}



