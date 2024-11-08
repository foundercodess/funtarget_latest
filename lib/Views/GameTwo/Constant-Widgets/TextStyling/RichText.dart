import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Constant/color.dart';


class GameTwoCustomRichText extends StatelessWidget {
  final List<CustomTextSpan> textSpans;
  final TextAlign? textAlign;
  final void Function()? onTap;

  GameTwoCustomRichText({super.key, required this.textSpans, this.textAlign, this.onTap});

  @override
  Widget build(BuildContext context) {
    List<TextSpan> children = [];

    for (CustomTextSpan span in textSpans) {
      children.add(
        TextSpan(
          text: span.text,
          style: GoogleFonts.ptSerif(
            textStyle: TextStyle(//15
                fontSize: span.fontSize==null?MediaQuery.of(context).size.width/65:span.fontSize,
                fontWeight:span.fontWeight??FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: span.textColor==null?ColorConstant.darkBlackColor:span.textColor,
              overflow: TextOverflow.ellipsis,
              height: 1.5
            ),
          )
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      child: RichText(
        textAlign:textAlign== null?TextAlign.left:textAlign!,
        text: TextSpan(children: children),
      ),
    );
  }
}

class CustomTextSpan {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  CustomTextSpan( {
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });
}
