import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class TimerState extends ChangeNotifier {
//   Timer? _timer;
//   int _remainingSeconds = 60;
//   DateTime _startTime = DateTime.now(); // Initial start time
//
//   int get remainingSeconds => _remainingSeconds;
//
//   TimerState() {
//     _startTimer();
//   }
//
//   void _startTimer() {
//     const duration = Duration(seconds: 1);
//     _timer = Timer.periodic(duration, (timer) {
//       DateTime currentTime = DateTime.now();
//       Duration timeDifference = currentTime.difference(_startTime);
//       _remainingSeconds = max(0, 60 - timeDifference.inSeconds);
//
//       if (_remainingSeconds == 0) {
//         _startTime = DateTime.now(); // Reset start time for the next minute
//       }
//
//       notifyListeners();
//     });
//   }
//
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
// }

// class TimerState extends ChangeNotifier {
//   Timer? _timer;
//   int _remainingSeconds = 60;
//   late DateTime _startTime;
//
//   int get remainingSeconds => _remainingSeconds;
//
//   TimerState() {
//     _initializeTimer();
//     _startTimer();
//   }
//
//   void _initializeTimer() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int storedSeconds = prefs.getInt('remainingSeconds') ?? 60;
//     _startTime = prefs.containsKey('startTime')
//         ? DateTime.parse(prefs.getString('startTime')!)
//         : DateTime.now();
//     _remainingSeconds = max(0, storedSeconds);
//
//     notifyListeners();
//   }
//
//   void _startTimer() {
//     const duration = Duration(seconds: 1);
//     _timer = Timer.periodic(duration, (timer) {
//       if (_remainingSeconds > 0) {
//         _remainingSeconds -= 1;
//       } else {
//         _remainingSeconds = 60;
//         _startTime = DateTime.now();
//       }
//
//       SharedPreferences.getInstance().then((prefs) {
//         prefs.setInt('remainingSeconds', _remainingSeconds);
//         prefs.setString('startTime', _startTime.toIso8601String());
//       });
//
//       notifyListeners();
//     });
//   }
//
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
// }

// class TimerState extends ChangeNotifier {
//   Timer? _timer;
//   int _remainingSeconds = 60;
//   late DateTime _startTime;
//
//   int get remainingSeconds => _remainingSeconds;
//
//   Function()? onTimerZeroCallback;
//   Function()? onTenSecondsLeft;
//
//   TimerState({
//     this.onTimerZeroCallback,
//     this.onTenSecondsLeft,
//   }) {
//     _initializeTimer();
//     _startTimer();
//   }
//
//   void _initializeTimer() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int storedSeconds = prefs.getInt('remainingSeconds') ?? 60;
//     _startTime = prefs.containsKey('startTime')
//         ? DateTime.parse(prefs.getString('startTime')!)
//         : DateTime.now();
//
//     Duration elapsedDuration = DateTime.now().difference(_startTime);
//     int elapsedSeconds = elapsedDuration.inSeconds;
//     _remainingSeconds = max(0, storedSeconds - elapsedSeconds);
//
//     notifyListeners();
//   }
//
//   // void _startTimer() {
//   //   const duration = Duration(seconds: 1);
//   //   _timer = Timer.periodic(duration, (timer) {
//   //     if (_remainingSeconds > 0) {
//   //       _remainingSeconds -= 1;
//   //     } else {
//   //       _remainingSeconds = 60;
//   //       _startTime = DateTime.now();
//   //     }
//   //
//   //     SharedPreferences.getInstance().then((prefs) {
//   //       prefs.setInt('remainingSeconds', _remainingSeconds);
//   //       prefs.setString('startTime', _startTime.toIso8601String());
//   //     });
//   //
//   //     notifyListeners();
//   //   });
//   // }
//
//  // if (_remainingSeconds > 0) {
// //           _remainingSeconds -= 1;
// //           SharedPreferencesUtil.setRemainingSeconds(_remainingSeconds);
// //         } else if (_remainingSeconds == 10) {
// //           widget.onTenSecondsLeft();
// //         } else {
// //           _remainingSeconds = 60;
// //           SharedPreferencesUtil.setRemainingSeconds(_remainingSeconds);
// //           widget.onTimerZeroCallback();
// //         }
//
//   // void _startTimer() {
//   //   const duration = Duration(seconds: 1);
//   //   _timer = Timer.periodic(duration, (timer) {
//   //     if (_remainingSeconds > 0) {
//   //       _remainingSeconds -= 1;
//   //     } else {
//   //       _remainingSeconds = 60;
//   //       _startTime = DateTime.now();
//   //
//   //       if (onTimerZeroCallback != null) {
//   //         onTimerZeroCallback!();
//   //       }
//   //     }
//   //
//   //     if (_remainingSeconds == 10) {
//   //       if (onTenSecondsLeft != null) {
//   //         onTenSecondsLeft!();
//   //       }
//   //     }
//   //
//   //     SharedPreferences.getInstance().then((prefs) {
//   //       prefs.setInt('remainingSeconds', _remainingSeconds);
//   //       prefs.setString('startTime', _startTime.toIso8601String());
//   //     });
//   //
//   //     notifyListeners();
//   //   });
//   // }
//
//   void _startTimer() {
//     const duration = Duration(milliseconds: 1000); // Changed to milliseconds
//     DateTime lastUpdateTime = DateTime.now();
//
//     _timer = Timer.periodic(duration, (timer) {
//       DateTime currentTime = DateTime.now();
//       Duration timeDifference = currentTime.difference(lastUpdateTime);
//
//       // Calculate the number of seconds elapsed since the last update
//       int elapsedSeconds = timeDifference.inSeconds;
//
//       if (_remainingSeconds > elapsedSeconds) {
//         _remainingSeconds -= elapsedSeconds;
//       } else {
//         // Handle the case when elapsed time is greater than remaining seconds
//         _remainingSeconds = 0;
//       }
//
//       lastUpdateTime = currentTime;
//
//       if (_remainingSeconds == 0) {
//         _startTime = DateTime.now(); // Reset start time for the next minute
//
//         if (onTimerZeroCallback != null) {
//           onTimerZeroCallback!();
//         }
//       }
//
//       if (_remainingSeconds == 10) {
//         if (onTenSecondsLeft != null) {
//           onTenSecondsLeft!();
//         }
//       }
//
//       SharedPreferences.getInstance().then((prefs) {
//         prefs.setInt('remainingSeconds', _remainingSeconds);
//         prefs.setString('startTime', _startTime.toIso8601String());
//       });
//
//       notifyListeners();
//     });
//   }
//
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
// }


// class TimerState extends ChangeNotifier {
//   late Timer _timer;
//   int _remainingSeconds = 60;
//   late DateTime _startTime;
//
//   int get remainingSeconds => _remainingSeconds;
//
//   Function()? onTimerZeroCallback;
//   Function()? onTenSecondsLeft;
//
//   TimerState({
//     this.onTimerZeroCallback,
//     this.onTenSecondsLeft,
//   }) {
//     _initializeTimer();
//   }
//
//   void _initializeTimer() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int storedSeconds = prefs.getInt('remainingSeconds') ?? 60;
//     _startTime = prefs.containsKey('startTime')
//         ? DateTime.parse(prefs.getString('startTime')!)
//         : DateTime.now();
//
//     Duration elapsedDuration = DateTime.now().difference(_startTime);
//     _remainingSeconds = max(0, storedSeconds - elapsedDuration.inSeconds);
//
//     notifyListeners();
//
//     if (_remainingSeconds > 0) {
//       _startTimer();
//     }
//   }
//
//   void _startTimer() {
//     const duration = Duration(seconds: 1);
//     _timer = Timer.periodic(duration, (timer) async {
//       if (_remainingSeconds > 0) {
//         _remainingSeconds -= 1;
//       } else {
//         _remainingSeconds = 60;
//         _startTime = DateTime.now();
//
//         if (onTimerZeroCallback != null) {
//           onTimerZeroCallback!();
//         }
//       }
//
//       if (_remainingSeconds == 10) {
//         if (onTenSecondsLeft != null) {
//           onTenSecondsLeft!();
//         }
//       }
//
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setInt('remainingSeconds', _remainingSeconds);
//       await prefs.setString('startTime', _startTime.toIso8601String());
//
//       // SharedPreferences.getInstance().then((prefs) {
//       //   prefs.setInt('remainingSeconds', _remainingSeconds);
//       //   prefs.setString('startTime', _startTime.toIso8601String());
//       // });
//
//       notifyListeners();
//     });
//   }
//
//   void disposeTimer() {
//     _timer.cancel();
//   }
//
//   void dispose() {
//     disposeTimer();
//     super.dispose();
//   }
// }
