
import 'package:flutter/material.dart';
import 'package:funtarget/Constant/color.dart';
import 'package:google_fonts/google_fonts.dart';


class GameTwoSubTitle_Text extends StatelessWidget {
  final String? Title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double? width;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final GoogleFonts? textStyle;
  GameTwoSubTitle_Text({super.key, this.Title, this.fontSize, this.fontWeight, this.textColor, this.width, this.textAlign, this.maxLines, this.softWrap, this.overflow, this.padding, this.alignment, this.textStyle}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      alignment:alignment==null?Alignment.center:alignment,
      child: Text(
        maxLines: maxLines,
          overflow: overflow,
        softWrap: softWrap,
        textAlign:textAlign,
          Title==null?"":Title!,
          style:textStyle==null?GoogleFonts.ptSerif(
            textStyle: TextStyle(//15
                fontSize: fontSize==null?MediaQuery.of(context).size.width/45:fontSize,
                fontWeight:fontWeight==null?FontWeight.normal:fontWeight,
                fontStyle: FontStyle.normal,
                color: textColor==null?ColorConstant.darkBlackColor:textColor,
            )
          ):GoogleFonts.ptSerif(
              textStyle: TextStyle(//15
                fontSize: fontSize==null?MediaQuery.of(context).size.width/45:fontSize,
                fontWeight:fontWeight==null?FontWeight.normal:fontWeight,
                fontStyle: FontStyle.normal,
                color: textColor==null?ColorConstant.darkBlackColor:textColor,
              )
          )
      ),
    );
  }
}
