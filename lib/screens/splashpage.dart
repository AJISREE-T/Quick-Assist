import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quickassist/screens/home_page.dart';
import 'package:quickassist/screens/login_page.dart';
import 'package:quickassist/screens/shop/shop_page.dart';
import 'package:quickassist/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  bool logined=false;

  checkLoginStatus()async{

    SharedPreferences _pref=await SharedPreferences.getInstance();
    var type=_pref.getString('role');
    logined =await AuthService().checkLogin();

    if(logined){

      if(type=="user"){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
      }

      else if(
      type =="shop"
      ){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ShopPage()), (route) => false);
      }

    }


  }

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
                padding: EdgeInsets.only(top: 560, left: 100),
            height: 620,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/mechanic1.jpg'),
                  fit: BoxFit.cover
              ),
            ),
                child: Text(
                  'Quick Assist',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  // ),
                )),

              Container(
                  padding: EdgeInsets.only(top: 15, left: 20),
                  child: Text(
                    'One Solution for all your vehichle maintenance',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70),
                  )),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  child: Container(
                    height: 48,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.orange[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Lets get started',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
