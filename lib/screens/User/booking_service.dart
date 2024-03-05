import 'package:flutter/material.dart';
class BookingServidce extends StatefulWidget {
  const BookingServidce({Key? key}) : super(key: key);

  @override
  State<BookingServidce> createState() => _BookingServidceState();
}

class _BookingServidceState extends State<BookingServidce> {
  @override
  Widget build(BuildContext context) {
    return  Container(


        child: ListView(
          children: [
            Container(

              height: 200,
              width: 300,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage('assets/image/mech5.jpg'),
                  fit: BoxFit.cover

                )

              ),
            ),

            Container(

              color: Colors.white,
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
                            'ajisree',
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
                                'pmna',
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
          ],
        ),
      );

  }
}
