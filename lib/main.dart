import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickassist/firebase_options.dart';
import 'package:quickassist/screens/User/user_page.dart';
import 'package:quickassist/screens/home_page.dart';
import 'package:quickassist/screens/login_page.dart';
import 'package:quickassist/screens/shop/shop_page.dart';
import 'package:quickassist/screens/splashpage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // routes: {
      //   '/':(context)=>SplashPage(),
      //   '/add':(context)=>LoginPage(),
      // },
      // initialRoute: '/',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}



