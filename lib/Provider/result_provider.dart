import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:funtarget/Constant/url.dart';

import '../Model/result-history-model.dart';
import '../Model/result-model.dart';

import 'package:http/http.dart' as http;

import '../Utils/message_utils.dart';

class ResultProvider extends ChangeNotifier {
  ResultModel? _result;

  ResultModel? get result => _result;

  Future<void> fetchResultData() async {
    final response = await http.get(Uri.parse(AppUrls.resultApiUrl));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if(responseData['status']==200){
        final Map<String, dynamic> data = json.decode(response.body);
        _result = ResultModel.fromJson(data);
      }
      else{
        Utils.errorToastMessage(responseData['message']);
      }
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}