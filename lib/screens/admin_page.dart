import 'package:flutter/material.dart';
class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Container(
        child: Column(
          children: [
            Text('adminpage')

          ],
        ),
      ),
    );
  }
}
