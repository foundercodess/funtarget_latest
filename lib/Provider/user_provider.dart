import 'package:flutter/foundation.dart';
import 'package:funtarget/api/auth-service-.dart';

import '../Model/user-login-model.dart';


class UserProvider with ChangeNotifier {
  UserModel? _user;

  final AuthService _authService;

  UserProvider(this._authService);

  UserModel? get user => _user;

  Future<UserModel?> login(String username, String password) async {
    UserModel? result = await _authService.login(username, password);

    if (result != null) {
      _user = result;
      notifyListeners();
    } else {
      if (kDebugMode) {
        print("login failed in user provider");
      }
      // Handle login failure
    }
  }
}
