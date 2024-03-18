import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickassist/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  CollectionReference userColelction =
      FirebaseFirestore.instance.collection('user');
  CollectionReference _shopCollection =
      FirebaseFirestore.instance.collection('shop');

  CollectionReference _loginCollection =
      FirebaseFirestore.instance.collection('login');

  // register

  Future<bool?> registereUser(UserModel user) async {
    // auth
    //firestore

    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: user.email.toString(), password: user.password.toString());

    if (userCredential.user!.uid != null) {
      try {
        if (user.role == "user") {
          await _loginCollection.doc(userCredential.user!.uid).set({
            'uid': userCredential.user!.uid,
            'email': user.email,
            'status': 1,
            'role': "user"
          });

          await userColelction.doc(userCredential.user!.uid).set({
            'uid': userCredential.user!.uid,
            'name': user.name,
            'phone': user.phone,
            'email': user.email,
            'createdat': DateTime.now(),
            'status': 1,
            'role': "user"
          });
        } else if (user.role == 'shop') {
          await _loginCollection.doc(userCredential.user!.uid).set({
            'uid': userCredential.user!.uid,
            'email': user.email,
            'status': 1,
            'role': "shop"
          });

          await _shopCollection.doc(userCredential.user!.uid).set({
            'uid': userCredential.user!.uid,
            'name': user.name,
            'phone': user.phone,
            'email': user.email,
            'createdat': DateTime.now(),
            'status': 1,
            'role': "shop"
          });
        }

        return true;
      } catch (e) {
        print(e);
        return false;
      }
    }
  }

  // login

  Future<void> login(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential != null) {
      var snap = await _loginCollection.doc(userCredential.user!.uid).get();

      if (snap['role'] == 'user') {
        var userData = await userColelction.doc(userCredential.user!.uid).get();

        SharedPreferences _pref = await SharedPreferences.getInstance();

        await _pref.setString('uid', userData['uid']);
        await _pref.setString('email', userData['email']);
        await _pref.setString('phone', userData['phone']);
        await _pref.setString('role', userData['role']);
        await _pref.setString(
            'token', await userCredential.user!.getIdToken() as String);
      }
    }
  }

  //logout

  Future<bool> checkLogin() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    var token = await _pref.getString('token');

    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logOut() async{

    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.clear();

    FirebaseAuth.instance.signOut();

  }
}
