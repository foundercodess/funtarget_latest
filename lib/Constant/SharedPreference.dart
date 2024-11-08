
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String getUserId() {
    return _prefs.getString('userId') ?? '';
  }

  static void setUserId(String userId) {
    _prefs.setString('userId', userId);
  }

  static void clearUserId() {
    _prefs.remove('userId');
  }

  // Chips setting
  static void setChipsValue(int chip) {
    _prefs.setInt('chipsValue', chip);
  }

  static int getChipsValue(){
    return _prefs.getInt("chipsValue")??0;
  }

  static void clearChipsValue() {
    _prefs.remove('chipsValue');
  }


  static void setLastResult(int resultValue) {
    _prefs.setInt('lastResult', resultValue);
  }

  static int getLastResult(){
    return _prefs.getInt("lastResult")??0;
  }

  static void clearLastResult() {
    _prefs.remove('lastResult');
  }

// Timer settings
//   static DateTime getStartTime() {
//     final timestamp = _prefs.getInt('startTimestamp');
//     return timestamp != null
//         ? DateTime.fromMillisecondsSinceEpoch(timestamp)
//         : DateTime.now();
//   }
//
//   static void setStartTime(DateTime startTime) {
//     _prefs.setInt('startTimestamp', startTime.millisecondsSinceEpoch);
//   }
//
//   static int getRemainingSeconds() {
//     return _prefs.getInt('remainingSeconds') ?? 60;
//   }
//
//   static void setRemainingSeconds(int remainingSeconds) {
//     _prefs.setInt('remainingSeconds', remainingSeconds);
//   }
//
//   static bool getTimerIsActive() {
//     return _prefs.getBool('timerIsActive') ?? false;
//   }
//
//   static void setTimerIsActive(bool isActive) {
//     _prefs.setBool('timerIsActive', isActive);
//   }

}
