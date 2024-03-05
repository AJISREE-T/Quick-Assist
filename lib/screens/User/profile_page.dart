import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final CollectionReference users =
  FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100,left: 20,right: 20),
      child: ListView(
        children: [
          Center(
            child: Container(
              width: 160,
              // color: Colors.red,
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(

                      radius: 60,
                      child: Icon(Icons.person,size: 75,color: Colors.black54,),
                    ),
                  ),Positioned(
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.orange[800],
                          radius:18,
                          // backgroundColor: Colors.white,
                          child: IconButton(onPressed: (){},icon:Center(child: Icon(Icons.edit,size: 15,color: Colors.white,),
                          ),

                          ),


                        ),
                      ),
                    ),


                    bottom: 0,
                    right: 10,
                  )


                ],
              ),

            ),
          ),
          SizedBox(height: 90,),

          TextFormField(



            decoration: InputDecoration(

              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),


            ),),
          SizedBox(height: 20,),
          TextFormField(


            decoration: InputDecoration(

              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),


            ),),
          SizedBox(height: 20,),
          TextFormField(


            decoration: InputDecoration(

              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),


            ),),
          SizedBox(height: 40,),


          Container(
            height: 50,
            width: 100,
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.orange),
              ),
              onPressed: () {

              },
              child: const Text(
                "Save Changes",
                style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w500),
              ),
            ),
          ),






        ],
      ),
    );
  }
}
