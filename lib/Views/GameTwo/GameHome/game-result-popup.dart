import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:funtarget/Constant/color.dart';
import 'package:funtarget/Views/Constant-Widgets/Container/Container_widget.dart';
import 'package:funtarget/Views/Constant-Widgets/TextStyling/AppBarTitle.dart';
import 'package:funtarget/Views/Constant-Widgets/TextStyling/titleStyle.dart';
import 'package:funtarget/Views/GameTwo/Constant-Widgets/Buttons/PrimaryButton.dart';
import 'package:funtarget/main.dart';

class GameResultPopUp extends StatefulWidget {
  const GameResultPopUp({Key? key}) : super(key: key);

  @override
  State<GameResultPopUp> createState() => _GameResultPopUpState();
}

class _GameResultPopUpState extends State<GameResultPopUp> {

  late ConfettiController _centerController;
  @override
  void initState() {
    super.initState();
    _centerController = ConfettiController(duration: const Duration(seconds: 5));
    _centerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: width / 3, vertical: 20),
      child: CustomContainer(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeadingOne(
              Title: "Result!!",
              textColor: ColorConstant.darkBlackColor,
              alignment: Alignment.center,
            ),
            Divider(),
            ConfettiWidget(
              confettiController: _centerController,
              blastDirection: -pi / 2,
              maxBlastForce: 80,
              minBlastForce: 5,
              emissionFrequency: 0.05,
              numberOfParticles: 50,
              shouldLoop: false,
              gravity: 0.20,
              blastDirectionality: BlastDirectionality.explosive,
            ),
            TitleStyle(Title: "Winner Number is: 5",textColor: ColorConstant.darkBlackColor,),
            SizedBox(height: 15,),
            GameTwoPrimaryButton(
              onTap: (){
                Navigator.pop(context);
              },
              color: Colors.red,
              Label: "close",
            ),

          ],
        ),
      ),
    );
  }
}
