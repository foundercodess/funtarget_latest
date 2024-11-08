import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:funtarget/Constant/SharedPreference.dart';
import 'package:funtarget/Constant/url.dart';
import 'package:funtarget/Utils/message_utils.dart';
import 'package:http/http.dart' as http;

class BetService with ChangeNotifier {
  BetService();

  Future<void> InsertBetApi(betJsonData) async {
    final userId = SharedPreferencesUtil.getUserId();
    final response = await http.post(
      Uri.parse(AppUrls.insertBetApiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userid': userId, 'bets': betJsonData}),
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(jsonDecode(response.body));
      }
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 200) {
        return Utils.toastMessage(responseData['message']);
      } else {
        return Utils.errorToastMessage(responseData['message']);
      }
    } else {
      if (kDebugMode) {
        print('Something went wrong: ${response.statusCode}');
      }
      return null;
    }
  }
}
