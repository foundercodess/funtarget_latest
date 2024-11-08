import 'package:flutter/material.dart';
import 'package:funtarget/Constant/assets.dart';
import 'package:funtarget/Constant/color.dart';
import 'package:funtarget/Views/Constant-Widgets/Container/Container_widget.dart';
import 'package:funtarget/Views/Constant-Widgets/TextStyling/smallTextStyle.dart';
import 'package:funtarget/Views/Constant-Widgets/TextStyling/subtitleStyle.dart';
import 'package:funtarget/main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: ColorConstant.darkBlackColor,
      leadingWidth: 120,
      leading: CustomContainer(
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, -1),
            color: Colors.yellow,
            spreadRadius: 0.5,
            blurRadius: 1,
            blurStyle: BlurStyle.inner,
          )
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
        margin: const EdgeInsets.only(left: 15, top: 12, bottom: 5),
        gradient: const LinearGradient(colors: [
          Colors.yellow,
          Colors.orangeAccent,
          Colors.orange,
          Colors.deepOrangeAccent
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        child: SubTitle_Text(
          Title: "lobby".toUpperCase(),
          fontWeight: FontWeight.bold,
          textColor: ColorConstant.whiteColor,
        ),
      ),
      title: SubTitle_Text(
        alignment: Alignment.centerLeft,
        Title: title,
        textColor: ColorConstant.orangeAccient,
      ),
      actions: [
        Row(
          children: [
            SubTitle_Text(
              textColor: ColorConstant.whiteColor,
              Title: "Welcome, User",
            ),
            const SizedBox(width: 10,),
            CustomContainer(
              padding: EdgeInsets.symmetric(horizontal: 5),
              gradient: LinearGradient(colors: [
                Colors.grey.shade700,
                Colors.grey.shade700,
                Colors.grey.shade500.withOpacity(0.8),
                Colors.grey.shade700,
                Colors.grey.shade700,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              widths:width/4,
              height: height/13,
              border: Border(
                top: BorderSide(width: 1, color: ColorConstant.whiteColor.withOpacity(0.6)),
                bottom: BorderSide(width: 1, color: ColorConstant.whiteColor.withOpacity(0.6)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubTitle_Text(textColor: ColorConstant.whiteColor,Title: "Balance",fontWeight: FontWeight.bold,),
                  CustomContainer(
                    alignment: Alignment.topCenter,
                    height: height/18,
                    widths: width/8,
                    gradient: LinearGradient(colors: [
                      Colors.orange,
                      Colors.orange.shade300,
                      Colors.yellow,
                      Colors.yellowAccent,
                      Colors.yellow,
                      Colors.orange.shade300,
                      Colors.orange,
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    child: Small_Text(Title: "0",fontWeight: FontWeight.bold,textColor: ColorConstant.darkBlackColor,),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(width: width/18,),
        IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Image.asset(Graphics.cancelButton, scale: 3.5,))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
