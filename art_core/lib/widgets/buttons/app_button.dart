import 'package:art_core/theme/styles.dart';
import 'package:art_core/widgets/loading_view.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../text/app_text.dart';

class AppButton extends StatelessWidget {
  final dynamic title;
  var onTap;
  bool? loading;
  final Color? color;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? heightText;
  final Color? textColor;

  final bool? enableBorder;
  final double? horizontalPadding;
  final Widget? leading;
  final FontWeight fontWeight;

  AppButton({
    Key? key,
    required this.title,
    this.onTap,
    this.loading = false,
    this.color,
    this.textColor,
    this.enableBorder = false,
    this.width,
    this.height,
    this.horizontalPadding,
    this.heightText,
    this.fontSize,
    this.leading,  this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading == true ? _loading() : _button();
  }



  final double _margeHorizontal = 24.0;

  BoxDecoration _decoration() {
    if (color != null) {
      return BoxDecoration(
          color: color,
          border: Border.all(color: enableBorder == true ? colorBlack : color!,width:enableBorder == true ?1.5:0 ));
    } else {
      return BoxDecoration(
          color: AppColors.primaryColorLight,
          border: Border.all(color: AppColors.primaryColorLight));
    }
  }

  Widget _loading() {
    return Container(
      alignment: Alignment.center,
      width: width ?? double.maxFinite,
      height: height ?? 50,
      margin: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? _margeHorizontal),
      decoration: _decoration(),
      child: const LoadingView(isButton: true),
    );
  }

  Widget _button() {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        alignment: Alignment.center,
        //width: double.maxFinite,
        height: height ??50,
        margin: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? _margeHorizontal),
        // padding: EdgeInsets.symmetric(vertical: _paddingVertical),
        width: width ?? double.maxFinite,
        decoration: _decoration(),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leading??const SizedBox() ,
              if (title is String )...[
                AppText(
                  text: title,
                  fontSize: fontSize ?? 15,
                  color: textColor == AppColors.primaryColor ? colorBlack : textColor ?? colorWhite,
                  fontWeight: fontWeight,
                  height: heightText ?? 1,
                )
              ]else ...[
                title
              ]
            ],
          ),
        ),
      ),
    );
  }
}
