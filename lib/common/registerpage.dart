import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickassist/models/user_model.dart';
import 'package:quickassist/screens/home_page.dart';
import 'package:quickassist/screens/login_page.dart';
import 'package:quickassist/services/auth_service.dart';
import 'package:quickassist/services/authe_view_model.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  // UserModel _userModel = UserModel();
  // AuthService _authService = AuthService();

  final _registerkey = GlobalKey<FormState>();
  bool visible = true;
  String? role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _registerkey,
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
                          text: '  Create an account',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.orange[800],
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  value: role,
                  decoration: InputDecoration(
                    hintText: "Register as",

                    // prefixIcon: Icon(Icons.email),
                    //suffixIcon: Icon(Icons.panorama_fish_eye),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (selectedrole) =>
                      setState(() => role = selectedrole!),
                  validator: (value) => value == null ? 'field required' : null,
                  items: ['User', 'Shop']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.orange[800]),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Full Name';
                    }
                  },
                  cursorColor: Colors.orange[800],
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
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
                  height: 15,
                ),
                TextFormField(
                  controller: _addressController,
                  // maxLines: 4,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Address';
                    }
                  },
                  cursorColor: Colors.orange[800],
                  decoration: InputDecoration(
                    hintText: 'Address',
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
                  height: 15,
                ),
                TextFormField(
                  controller: _phoneController,
                  validator: (value) {
                    if (value!.length != 10 || num.tryParse(value) == null) {
                      return 'Phone Number should contains 10 digits ';
                    }
                  },
                  cursorColor: Colors.orange[800],
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
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
                  height: 15,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value!)) {
                      return 'Email format is invalid';
                    } else {
                      return null;
                    }

                    // if(value!.isEmpty){
                    //   return 'Enter Email';
                    // }
                  },
                  cursorColor: Colors.orange[800],
                  decoration: InputDecoration(
                    hintText: 'Email',
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
                  height: 15,
                ),
                TextFormField(
                  controller: _passController,
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Password should contains atleast 8 characters';
                    } else {
                      return null;
                    }
                  },
                  obscureText: visible,
                  obscuringCharacter: '*',
                  cursorColor: Colors.orange[800],
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            visible = !visible; // visible/invisible password
                          });
                        },
                        child: Icon(
                          visible == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if (_registerkey.currentState!.validate()) {
                      UserModel user = UserModel(
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passController.text,
                        phone: _phoneController.text,
                        role: role!.toLowerCase(),
                      );

                    AuthServiewViewModel _authView=AuthServiewViewModel();
                      final res = await _authView.registerUser(user);

                      if (res == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Some errro")));
                      }

                      // UserCredential userData= await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      //      email: _emailController.text.trim(),
                      //      password: _passController.text.trim());
                      // if(userData!=null){
                      //
                      //
                      //   FirebaseFirestore.instance.collection('users').doc(userData.user!.uid).set({
                      //
                      //     'uid':userData.user!.uid,
                      //     'email':userData.user!.email,
                      //     'name':_nameController.text,
                      //     'address':_addressController.text,
                      //     'phone':_phoneController.text,
                      //     'role':role,
                      //     'status':1
                      //
                      //   }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage())));
                      // }
                      //
                      //  // _userModel = UserModel(
                      //  //   email: _emailController.text,
                      //  //   password: _passController.text,
                      //  //   name: _nameController.text,
                      //  //   phone: _phoneController.toString(),
                      //  //   address: _addressController.text,
                      //  //   status: 1,
                      //  // );
                      //  // final userdata =
                      //  //     await _authService.registerUser(_userModel);
                      //  // if (userdata != null) {
                      //  //   Navigator.push(
                      //  //       context,
                      //  //       MaterialPageRoute(
                      //  //           builder: (context) => HomePage()));
                      //  // }
                    }
                  },
                  child: Container(
                    height: 48,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange[800],
                    ),
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange[800]),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showsnackbar(var msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
