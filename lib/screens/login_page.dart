import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickassist/common/registerpage.dart';
import 'package:quickassist/models/user_model.dart';
import 'package:quickassist/screens/User/user_page.dart';
import 'package:quickassist/screens/admin_page.dart';
import 'package:quickassist/screens/home_page.dart';
// import 'package:quickassist/screens/register_page.dart';
import 'package:quickassist/screens/shop/shop_page.dart';
import 'package:quickassist/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginkey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.only(top: 70, left: 20, right: 20),
          height: double.infinity,
          width: double.infinity,
          child:
          Form(
            key: _loginkey,
            child:
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  RichText(
                    text: TextSpan(
                        text: 'Hey,',
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.black45,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: '  Bring help to to your door steps',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.orange[800],
                                fontWeight: FontWeight.w700),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter an email id';
                      }
                    },
                    cursorColor: Colors.orange[800],
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter ';
                      }
                    },
                    cursorColor: Colors.orange[800],
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.orange[800],
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async{
                      if (_loginkey.currentState!.validate()) {
                        try {
                          // Check if the provided credentials are for an admin
                          if (_emailController.text == "admin@gmail.com" &&
                              _passController.text == '12345678') {
                            // If so, navigate to the admin page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminPage(),
                              ),
                            );
                            return; // Exit early to prevent further login attempts
                          }

                          // If not admin, proceed with regular user login
                          UserCredential userCredential =
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passController.text,
                          );

                          if (userCredential.user != null) {
                            DocumentSnapshot userDoc = await FirebaseFirestore.instance
                                .collection('users')
                                .doc(userCredential.user!.uid)
                                .get();

                            if (userDoc.exists) {
                              String role = userDoc['role'] ?? ''; // Fetch the user's role
                              if (role == 'User') {
                                // If the user is a regular user, navigate to the user's home page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              } else if (role == 'Shop') {
                                // If the user is a shop owner, navigate to the shop owner's home page
                                // Replace ShopHomePage with the actual page for shop owners
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShopPage(),
                                  ),
                                );
                              } else {
                                // If the role is not defined or recognized, handle it accordingly
                                print('Unknown role: $role');
                                // Optionally, you can display an error message to the user
                              }
                            } else {
                              // If the user document doesn't exist, handle it accordingly
                              print('User document does not exist');
                              // Optionally, you can display an error message to the user
                            }
                          } else {
                            // If userCredential.user is null, handle it accordingly
                            print('User is null');
                            // Optionally, you can display an error message to the user
                          }
                        } catch (e) {
                          print('Error signing in: $e');
                          // Handle the error during sign-in process
                          // Optionally, you can display an error message to the user
                        }
                      }
                    },


                    child: Container(
                      height: 55,
                      width: 480,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange[800]),
                      child: Center(
                          child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an Account?",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationPage()));
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.orange[800]),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ),
    );
  }
}
