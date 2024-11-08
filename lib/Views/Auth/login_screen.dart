import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funtarget/Constant/assets.dart';
import 'package:funtarget/Constant/color.dart';
import 'package:funtarget/Route/route.dart';
import 'package:funtarget/Views/Constant-Widgets/Container/Container_widget.dart';
import 'package:funtarget/Views/Constant-Widgets/Text%20Field/TextField_widget.dart';
import 'package:funtarget/Views/Constant-Widgets/TextStyling/RichText.dart';
import 'package:funtarget/Views/Constant-Widgets/TextStyling/smallTextStyle.dart';
import 'package:funtarget/main.dart';
import 'package:provider/provider.dart';

import '../../Provider/user_provider.dart';
import '../../Utils/message_utils.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final TextEditingController _userName = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.darkBlackColor,
      body: Center(
        child: SingleChildScrollView(
          child: CustomContainer(
            widths: width,
            height: height,
            image: const DecorationImage(
                image: AssetImage(Graphics.loginBg), fit: BoxFit.fitWidth),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(colors: [
                    ColorConstant.darkBlackColor.withOpacity(0.9),
                    ColorConstant.darkBlackColor.withOpacity(0.7),
                    Colors.transparent,
                    Colors.transparent,
                    ColorConstant.darkBlackColor.withOpacity(0.7),
                    ColorConstant.darkBlackColor.withOpacity(0.9)
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [const Spacer(), closeApp()],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      playInfo(),
                      appLogo(),
                      loginWidget(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget closeApp() {
    return IconButton(
      onPressed: () {
        SystemNavigator.pop();
      },
      icon: Image.asset(
        Graphics.cancelButton,
        scale: 4.5,
      ),
      padding: const EdgeInsets.all(0),
    );
  }

  Widget playInfo() {
    return CustomContainer(
      borderRadius: BorderRadius.circular(8),
      padding: const EdgeInsets.all(2),
      widths: width / 3,
      gradient: LinearGradient(colors: [
        ColorConstant.whiteColor.withOpacity(0.5),
        ColorConstant.darkBlackColor.withOpacity(0.4),
        Colors.transparent,
        Colors.transparent,
        Colors.transparent,
        ColorConstant.darkBlackColor.withOpacity(0.4),
        ColorConstant.whiteColor.withOpacity(0.5)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      child: CustomContainer(
        borderRadius: BorderRadius.circular(8),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        widths: width / 3,
        color: ColorConstant.darkBlackColor.withOpacity(0.5),
        border: Border.all(
            width: 0.5, color: ColorConstant.whiteColor.withOpacity(0.3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomRichText(
              textAlign: TextAlign.left,
              textSpans: [
                CustomTextSpan(
                  text: '⬤ ',
                  textColor: Colors.orange,
                ),
                CustomTextSpan(
                    text: 'Register & ', textColor: ColorConstant.whiteColor),
                CustomTextSpan(
                    text: "PLAY FOR FREE",
                    textColor: Colors.orangeAccent.withOpacity(0.8),
                    fontWeight: FontWeight.bold),
              ],
            ),
            CustomRichText(
              textAlign: TextAlign.left,
              textSpans: [
                CustomTextSpan(
                  text: '⬤ ',
                  textColor: Colors.orange,
                ),
                CustomTextSpan(
                    text: 'Get ', textColor: ColorConstant.whiteColor),
                CustomTextSpan(
                    text: "100 FREE CHIPS ",
                    textColor: Colors.orangeAccent.withOpacity(0.8),
                    fontWeight: FontWeight.bold),
                CustomTextSpan(
                  text: "on every login",
                  textColor: ColorConstant.whiteColor,
                ),
              ],
            ),
            CustomRichText(
              textAlign: TextAlign.left,
              textSpans: [
                CustomTextSpan(
                  text: '⬤ ',
                  textColor: Colors.orange,
                ),
                CustomTextSpan(
                    text:
                        'Our games are intended for use by an adult audience for amusement purpose only ',
                    textColor: ColorConstant.whiteColor),
              ],
            ),
            CustomRichText(
              textAlign: TextAlign.left,
              textSpans: [
                CustomTextSpan(
                  text: '⬤ ',
                  textColor: Colors.orange,
                ),
                CustomTextSpan(
                    text: 'No DEPOSIT ',
                    textColor: Colors.green,
                    fontWeight: FontWeight.bold),
                CustomTextSpan(
                  text: "(or) any changes required to play on the site ",
                  textColor: ColorConstant.whiteColor,
                ),
              ],
            ),
            CustomRichText(
              textAlign: TextAlign.left,
              textSpans: [
                CustomTextSpan(
                  text: '⬤ ',
                  textColor: Colors.orange,
                ),
                CustomTextSpan(
                    text: 'No redemption or cash winnings ',
                    textColor: ColorConstant.whiteColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget appLogo() {
    return CustomContainer(
      height: height / 2.2,
      widths: width / 3.3,
      image: const DecorationImage(
          image: AssetImage(Graphics.appLogo), fit: BoxFit.contain),
    );
  }

  Widget loginWidget(BuildContext context) {
    return CustomContainer(
        widths: width / 4,
        child: Column(
          children: [
            Small_Text(
              Title: "Username",
              textColor: ColorConstant.whiteColor.withOpacity(0.7),
            ),
            CustomTextField(
              controller: _userName,
              textcolor: ColorConstant.whiteColor,
              filled: true,
              fillColor: ColorConstant.darkBlackColor.withOpacity(0.3),
              height: 30,
              textAlignVertical: TextAlignVertical.top,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 10,
            ),
            Small_Text(
              Title: "Password",
              textColor: ColorConstant.whiteColor.withOpacity(0.7),
            ),
            CustomTextField(
              controller: _password,
              textcolor: ColorConstant.whiteColor,
              filled: true,
              fillColor: ColorConstant.darkBlackColor.withOpacity(0.3),
              height: 30,
              textAlignVertical: TextAlignVertical.top,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomContainer(
              onTap: () async {
                String username = _userName.text.trim();
                String password = _password.text.trim();
                if (_userName.text.isNotEmpty && _password.text.isNotEmpty) {
                  await context.read<UserProvider>().login(username, password);
                  if (context.read<UserProvider>().user != null) {
                    Navigator.pushNamed(context, AppRoutes.dashboardScreen);
                  } else {
                    Utils.snackBar("Login failed. Please try again.", context);
                  }
                } else {
                  Utils.snackBar("Must be enter valid details.", context);
                }
              },
              widths: width / 6,
              child: Image.asset(Graphics.loginButton),
            )
          ],
        ));
  }
}
