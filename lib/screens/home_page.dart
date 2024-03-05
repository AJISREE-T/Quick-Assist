import 'package:flutter/material.dart';
import 'package:quickassist/screens/User/booking_page.dart';
import 'package:quickassist/screens/User/profile_page.dart';
import 'package:quickassist/screens/User/user_page.dart';
import 'package:quickassist/screens/shop/shop_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  List<Widget> widgetOptions=[
    UserPage(),
    ShopPage(),
    BookingPage(),
    ProfilePage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // appBar: AppBar(),

      bottomNavigationBar:BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (int index){
        setState(() {
          _selectedIndex=index;
        });
        print(_selectedIndex);
      },
      items: [
        BottomNavigationBarItem(backgroundColor:Colors.orange[800],icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(backgroundColor:Colors.orange[800],icon: Icon(Icons.home_repair_service),label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.book_online),label: 'Booking'),
        BottomNavigationBarItem(icon: Icon(Icons.person_rounded),label: 'Profile'),

      ],
    ) ,

      body: widgetOptions.elementAt(_selectedIndex),
    );
  }
}
