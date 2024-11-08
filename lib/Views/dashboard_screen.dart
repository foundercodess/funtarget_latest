import 'package:flutter/material.dart';
import 'package:funtarget/Constant/color.dart';
import 'package:funtarget/Views/Constant-Widgets/Container/Container_widget.dart';
import 'package:funtarget/Views/Constant-Widgets/constant_appbar.dart';
import 'package:funtarget/Views/fun_target/Game-Home/home_screen.dart';

import '../Constant/assets.dart';
import '../main.dart';

class DashboardPageScreen extends StatefulWidget {
  const DashboardPageScreen({Key? key}) : super(key: key);

  @override
  State<DashboardPageScreen> createState() => _DashboardPageScreenState();
}

class _DashboardPageScreenState extends State<DashboardPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.darkBlackColor,
      appBar:const CustomAppBar(title: 'For Ammusement Only',) ,
      body:Center(
        child: CustomContainer(
          border: const Border(
            top: BorderSide(color: Colors.red)
          ),
          height: height,
          image: const DecorationImage(
              image: AssetImage(Graphics.loginBg),
              fit: BoxFit.fitWidth
          ),
          child: Container(
            alignment: Alignment.center,
            height: height,
            decoration: BoxDecoration(
                color: Colors.red,
                gradient:  LinearGradient(colors: [ColorConstant.darkBlackColor.withOpacity(0.9), ColorConstant.darkBlackColor.withOpacity(0.7), Colors.transparent, Colors.transparent,Colors.transparent,ColorConstant.darkBlackColor.withOpacity(0.7), ColorConstant.darkBlackColor.withOpacity(0.9)])
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomContainer(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2,2),
                        color: ColorConstant.whiteColor.withOpacity(0.4),
                        blurRadius: 2,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.inner
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  padding: const EdgeInsets.all(5),
                  height: height/2,
                  widths: width/4.5,
                  color: ColorConstant.darkBlackColor,
                  // border: Border.all(width: 2, color: ColorConstant.orangeAccient),
                  image: const DecorationImage(
                      image: AssetImage(Graphics.green36Image),
                      fit: BoxFit.cover
                  ),
                  alignment: Alignment.center,
                  child: CustomContainer(
                    height: height/6,
                    widths: height/6,
                    borderRadius: BorderRadius.circular(5),
                    alignment: Alignment.center,
                    color: ColorConstant.greyColor.withOpacity(0.8),
                    child: Icon(Icons.lock,size: height/6,),
                  ),
                ),
                // CustomContainer(
                //   onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>GameTwoHome()));
                //   },
                //   boxShadow: [
                //     BoxShadow(
                //         offset: Offset(2,2),
                //         color: ColorConstant.whiteColor.withOpacity(0.4),
                //         blurRadius: 2,
                //         spreadRadius: 1,
                //         blurStyle: BlurStyle.inner
                //     )
                //   ],
                //   borderRadius: BorderRadius.circular(15),
                //   padding: EdgeInsets.all(10),
                //   height: height/2,
                //   widths: width/4.5,
                //   color: ColorConstant.darkBlackColor.withOpacity(0.6),
                //   image: DecorationImage(
                //       image: AssetImage(Graphics.gameHome),
                //       fit: BoxFit.cover
                //   ),
                //   alignment: Alignment.bottomCenter,
                //   child: TitleStyle(Title: "Game 2",),
                // ),
                CustomContainer(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePageScreen()));
                  },
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2,2),
                        color: ColorConstant.whiteColor.withOpacity(0.4),
                        blurRadius: 2,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.inner
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  padding: const EdgeInsets.all(10),
                  height: height/2,
                  widths: width/4.5,
                  color: ColorConstant.darkBlackColor.withOpacity(0.6),
                  image: const DecorationImage(
                      image: AssetImage(Graphics.gameLogo),
                      fit: BoxFit.cover
                  ),
                ),
                CustomContainer(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2,2),
                        color: ColorConstant.whiteColor.withOpacity(0.4),
                        blurRadius: 2,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.inner
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  padding: const EdgeInsets.all(10),
                  height: height/2,
                  widths: width/4.5,
                  color: ColorConstant.darkBlackColor,
                  image: const DecorationImage(
                      image: AssetImage(Graphics.blue36Image),
                      fit: BoxFit.cover
                  ),
                  alignment: Alignment.center,
                  child: CustomContainer(
                    height: height/6,
                    widths: height/6,
                    borderRadius: BorderRadius.circular(5),
                    alignment: Alignment.center,
                    color: ColorConstant.greyColor.withOpacity(0.8),
                    child: Icon(Icons.lock,size: height/6,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
