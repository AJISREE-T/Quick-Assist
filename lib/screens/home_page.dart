import 'package:flutter/material.dart';
import 'package:quickassist/screens/User/booking_page.dart';
import 'package:quickassist/screens/User/profile_page.dart';
import 'package:quickassist/screens/User/user_page.dart';
import 'package:quickassist/screens/User/view_shop.dart';
import 'package:quickassist/screens/login_page.dart';
import 'package:quickassist/screens/shop/shop_page.dart';
import 'package:quickassist/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> widgetOptions = [
    UserPage(),
    ViewShop(),
    BookingPage(),
    ProfilePage(),
  ];

  String? email;

  getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    email = await _pref.getString('email');

    setState(() {});
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                Row(
                  children: [Text(email.toString())],
                )
              ],
            )),

            ListTile(
              title: Text("Log Out"),
              trailing: IconButton(
                onPressed: (){

                  AuthService _autservice=AuthService();

                  _autservice.logOut().then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false));
                },
                icon: Icon(Icons.logout),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(backgroundColor: Colors.orange[800]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          print(_selectedIndex);
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.orange[800],
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Colors.orange[800],
              icon: Icon(Icons.home_repair_service),
              label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online), label: 'Booking'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
      body: widgetOptions.elementAt(_selectedIndex),
    );
  }
}
