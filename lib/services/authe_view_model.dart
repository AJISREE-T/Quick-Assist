import 'package:flutter/cupertino.dart';
import 'package:quickassist/services/auth_service.dart';

import '../models/user_model.dart';

class AuthServiewViewModel with ChangeNotifier {
  bool? res;

  AuthService _authService = AuthService();

  // regidter user

  Future<bool?> registerUser(UserModel user) async {
    res = await _authService.registereUser(user);
    notifyListeners();
    return res;
  }
}
