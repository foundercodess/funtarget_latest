import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:funtarget/Constant/SharedPreference.dart';
import 'package:funtarget/Constant/url.dart';
import 'package:funtarget/Model/user-login-model.dart';
import 'package:funtarget/Utils/message_utils.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {

  AuthService();

  Future<UserModel?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(AppUrls.loginApiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(jsonDecode(response.body));
      }
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print(responseData);
      print("bet place response");
      if(responseData['status']==200){
        final Map<String, dynamic> userData = responseData['data'];
        final UserModel user = UserModel.fromJson(userData);
        SharedPreferencesUtil.setUserId(user.id);
        Utils.toastMessage(responseData['message']);
        return user;
      }else{
       return Utils.errorToastMessage(responseData['message']);
      }
    } else {
      if (kDebugMode) {
        print('Login failed: ${response.statusCode}');
      }
      return null;
    }
  }
}
