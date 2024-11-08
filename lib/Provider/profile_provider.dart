import 'package:flutter/material.dart';
import 'package:funtarget/Model/profile-model.dart';
import 'package:funtarget/api/profile-service.dart';

class ProfileProvider with ChangeNotifier {
  Profile? _profile;
  String _errorMessage = "";

  Profile? get profile => _profile;
  String get errorMessage => _errorMessage;

  final ProfileService _profileService = ProfileService();

  Future<void> fetchProfile() async {
    try {
      final response = await _profileService.getProfile();
      _profile = Profile.fromJson(response['data']);
      notifyListeners();
    } catch (e) {
      _errorMessage = "Failed to load profile: $e";
      notifyListeners();
    }
  }
}
