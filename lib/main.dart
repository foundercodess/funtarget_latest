import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funtarget/Constant/SharedPreference.dart';
import 'package:funtarget/Provider/profile_provider.dart';
import 'package:funtarget/Provider/result_history_provider.dart';
import 'package:funtarget/Provider/result_provider.dart';
import 'package:funtarget/api/auth-service-.dart';
import 'package:funtarget/Provider/user_provider.dart';
import 'package:funtarget/Route/route.dart';
import 'package:funtarget/api/bet-service.dart';
import 'package:funtarget/api/take-winning-amount-service.dart';
import 'package:provider/provider.dart';


double height = 360.0;
double width = 720.0;
double ratio = 2;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: []);
  await SharedPreferencesUtil.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    double heightRatio = MediaQuery.of(context).size.height;
    double widthRatio = MediaQuery.of(context).size.width;
    ratio = widthRatio / heightRatio;
    height = heightRatio;
    width = heightRatio * double.parse(ratio.toStringAsFixed(1));
    final userId= SharedPreferencesUtil.getUserId();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(create: (_)=>AuthService()),
        ChangeNotifierProvider(create: (context)=>UserProvider(context.read<AuthService>())),
        ChangeNotifierProvider(create: (context)=>BetService()),
        ChangeNotifierProvider(create: (context)=>ResultHistoryProvider()),
        ChangeNotifierProvider(create: (context)=>ResultProvider()),
        ChangeNotifierProvider(create: (context)=>ProfileProvider()),
        ChangeNotifierProvider(create: (context)=>WinningAmountService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fun target',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
        initialRoute: AppRoutes.loginScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}
