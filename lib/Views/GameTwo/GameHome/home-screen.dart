// ignore_for_file: file_names, camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:funtarget/Constant/SharedPreference.dart';
import 'package:funtarget/Constant/assets.dart';
import 'package:funtarget/Constant/color.dart';
import 'package:funtarget/Views/Constant-Widgets/Buttons/PrimaryButton.dart';
import 'package:funtarget/Views/Constant-Widgets/Container/Container_widget.dart';
import 'package:funtarget/Views/Constant-Widgets/TextStyling/AppBarTitle.dart';
import 'package:funtarget/Views/Constant-Widgets/TextStyling/smallTextStyle.dart';
import 'package:funtarget/Views/GameTwo/Constant-Widgets/TextStyling/smallTextStyle.dart';
import 'package:funtarget/Views/GameTwo/Constant-Widgets/TextStyling/subtitleStyle.dart';
import 'package:funtarget/Views/GameTwo/GameHome/game-result-popup.dart';
import 'package:funtarget/main.dart';
import 'package:motion/motion.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../Constant-Widgets/TextStyling/titleStyle.dart';

class GameTwoHome extends StatefulWidget {
  const GameTwoHome({Key? key}) : super(key: key);

  @override
  State<GameTwoHome> createState() => _GameTwoHomeState();
}

class _GameTwoHomeState extends State<GameTwoHome> {
  var selectedChip;
  List<int> priceList = [5, 10, 20, 50, 100, 500];

  List<int> appliedBetOnNumberList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  List<resultClass> scoreList = [
    resultClass("12:00 AM", "5"),
    resultClass("04:52 AM", "4"),
    resultClass("01:45 AM", "1"),
    resultClass("02:23 AM", "8"),
    resultClass("06:35 AM", "4"),
    resultClass("08:25 AM", "5"),
    resultClass("10:18 AM", "6"),
    resultClass("05:12 AM", "3"),
  ];

  @override
  void initState() {
    super.initState();
    openResultPopUp();
  }

  openResultPopUp() {
    Timer(Duration(minutes: 1), () {
      print("cond staisfied");
      showDialog(
          context: context,
          builder: (context) {
            return GameResultPopUp();
          });
    }).cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.darkBlackColor,
      body: CustomContainer(
        image: const DecorationImage(
          image: AssetImage(Graphics.gameTwoHomeBg),
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ),
        widths: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomContainer(
              padding: const EdgeInsets.only(
                  top: 0, left: 10, bottom: 10, right: 10),
              widths: width / 1.4,
              height: height,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sectionOnePartOne(),
                  sectionOnePartTwo(),
                  sectionOnePartThree(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: CustomContainer(
                widths: width / 3.75,
                height: height,
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: sectionTwo(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionOnePartOne() {
    return CustomContainer(
      widths: width / 1.32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GameTwoSmall_Text(
            Title: "Balance: 1348",
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GameTwoSmall_Text(
                fontSize: width / 33,
                Title: "Draw: 02:30 PM",
              ),
              const SizedBox(
                width: 5,
              ),
              GameTwoSmall_Text(
                Title: "1:58",
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: CircleAvatar(
                      radius: width / 50,
                      child: const Icon(Icons.question_mark))),
              IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: CircleAvatar(
                      radius: width / 50,
                      child: const Icon(Icons.change_circle_outlined))),
              IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: CircleAvatar(
                      radius: width / 50,
                      child: const Icon(Icons.cancel_outlined))),
            ],
          )
        ],
      ),
    );
  }

  Widget sectionOnePartTwo() {
    return Container(
      width: width / 1.5,
      height: height / 2.2,
      alignment: Alignment.center,
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 1.55
            ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                setState(() {
                  final selectedCoinValue = SharedPreferencesUtil.getChipsValue();
                  appliedBetOnNumberList[index] =
                      (appliedBetOnNumberList[index] + selectedCoinValue)
                          as int;
                });
                print(appliedBetOnNumberList[index]);
              },
              child: circleJellyEffectButton(index.toString(),appliedBetOnNumberList[index].toString()));
        },
      ),
    );
  }

  Widget circleJellyEffectButton(String value, String appliedBet) {
    return WidgetAnimator(
      atRestEffect: WidgetRestingEffects.bounce(
          duration: const Duration(milliseconds: 10000)),
      child: Motion.elevated(
        elevation: 50,
        borderRadius: BorderRadius.circular(40),
        shadow: true,
        child: Container(
          alignment: Alignment.center,
          width: width / 9.8,
          height: width / 9.8,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Color(0xffb52309),
              Color(0xffff2600),
              Color(0xffb52309),
            ]),
          ),
          child: Container(
            width: width / 12,
            height: width / 12,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xffb52309),
                  Color(0xfffa3939),
                  Color(0xffb52309),
                ],
                tileMode: TileMode.mirror,
              ),
              image: const DecorationImage(
                  image: AssetImage(Graphics.circleButton)),
            ),
            child:appliedBet=="0"?HeadingOne(
              Title: value.toString(),
              fontWeight: FontWeight.bold,
              alignment: Alignment.center,
              textColor: ColorConstant.darkBlackColor,
            ) :Column(
              children: [
                HeadingOne(
                  Title: value.toString(),
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                  textColor: ColorConstant.darkBlackColor,
                ),
                Small_Text(Title: "$appliedBet",)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // party pooper code
  // ConfettiWidget(
  // confettiController: _centerController,
  // blastDirection: -pi / 2,
  // maxBlastForce: 80,
  // minBlastForce: 1,
  // emissionFrequency: 0,
  // numberOfParticles: 20,
  // shouldLoop: false,
  // gravity: 0.50,
  // blastDirectionality: BlastDirectionality.explosive,
  // ), late ConfettiController _centerController;
//   _centerController =
//   ConfettiController(duration: const Duration(seconds: 3));
//   _centerController.play();
// }

  Widget sectionOnePartThree() {
    return CustomContainer(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.centerLeft,
      widths: width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomContainer(
            widths: width / 2.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  priceList.length,
                  (index) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedChip = index;
                          });
                          SharedPreferencesUtil.setChipsValue(priceList[index]);
                          print("ddddd");
                          print(SharedPreferencesUtil.getChipsValue());
                        },
                        child: Container(
                          width: width / 20,
                          height: width / 20,
                          decoration: BoxDecoration(
                            border: selectedChip == index
                                ? Border.all(width: 1.5, color: Colors.yellow)
                                : Border.all(
                                    width: 1, color: Colors.transparent),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(Graphics.silverBtn),
                            ),
                          ),
                          child: GameTwoSubTitle_Text(
                            Title: priceList[index].toString(),
                            fontWeight: FontWeight.w600,
                            textColor: ColorConstant.darkBlackColor,
                          ),
                        ),
                      )),
            ),
          ),
          CustomContainer(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return GameResultPopUp();
                  });
            },
            widths: width / 10,
            height: height / 10,
            image: const DecorationImage(
                image: AssetImage(Graphics.bttom), fit: BoxFit.fill),
          )
        ],
      ),
    );
  }

  Widget sectionTwo() {
    return Column(
      children: [
        CustomContainer(
          padding: const EdgeInsets.all(2),
          color: Colors.red,
          border: Border.all(width: 0.5, color: ColorConstant.whiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomContainer(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffb52309),
                      Color(0xfffa3939),
                      Color(0xffb52309),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                  border:
                      Border.all(width: 0.5, color: ColorConstant.whiteColor),
                  widths: width / 8.2,
                  child: const GameTwoTitleStyle(
                    Title: "TIME",
                    textAlign: TextAlign.center,
                    alignment: Alignment.center,
                  )),
              CustomContainer(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffb52309),
                      Color(0xfffa3939),
                      Color(0xffb52309),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                  border:
                      Border.all(width: 0.5, color: ColorConstant.whiteColor),
                  widths: width / 8.5,
                  child: const GameTwoTitleStyle(
                    Title: "RESULT",
                  )),
            ],
          ),
        ),
        CustomContainer(
          color: Colors.black.withOpacity(0.3),
          border: Border.all(width: 0.5, color: ColorConstant.whiteColor),
          child: Column(
            children: List.generate(
                scoreList.length,
                (index) => CustomContainer(
                      child: Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: CustomContainer(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffcaf9fc),
                              Color(0xff20e7f5),
                              Color(0xffcaf9fc),
                            ],
                            tileMode: TileMode.mirror,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomContainer(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  widths: width / 8.5,
                                  child: GameTwoSmall_Text(
                                    Title: scoreList[index].time,
                                  )),
                              CustomContainer(
                                  border: Border(
                                      left: BorderSide(
                                          width: 0.5,
                                          color: ColorConstant.darkBlackColor)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  widths: width / 8.2,
                                  child: GameTwoSmall_Text(
                                    Title: scoreList[index].result,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        )
      ],
    );
  }
}

class resultClass {
  final String time;
  final String result;
  resultClass(this.time, this.result);
}
