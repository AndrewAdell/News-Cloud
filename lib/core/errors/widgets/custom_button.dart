import 'package:flutter/material.dart';
import 'package:news_app/core/errors/util/styles.dart';

class CustomButton extends StatelessWidget {  
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.text,
      required this.textColor,
      required this.borderRadius,
      this.fontSize,
      required this.onPressed});
  final Color? backgroundColor;
  final Color textColor;
  final String text;
  final BorderRadius borderRadius;
  final double? fontSize;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {                
    return SizedBox(   
      height: 48,
      child: TextButton(
          style: TextButton.styleFrom(    
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            backgroundColor: backgroundColor,
          ),
          onPressed: onPressed,
          child: Text(  
            text,
            style: Styles.textStyle18.copyWith(  
                color: textColor,
                fontWeight: FontWeight.w900,
                fontSize: fontSize),
          )),
    );
  }
}


