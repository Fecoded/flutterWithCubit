import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import '../misc/colors.dart';

class AppButton extends StatelessWidget {
  final Color? color;
  final String? text;
  final IconData? icon;
  final Color? backgroundColor;
  final double? size;
  final Color? borderColor;
  final bool? isIcon;

  const AppButton(
      {Key? key,
      this.isIcon = false,
      required this.color,
      required this.size,
      required this.backgroundColor,
      required this.borderColor,
      this.text = "hi",
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor!, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color!,
              ),
            )
          : Icon(
              icon,
              color: color,
            ),
    );
  }
}
