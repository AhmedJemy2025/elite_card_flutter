import 'package:art_core/widgets/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../theme/styles.dart';
class CustomTitle extends StatelessWidget {
  final VoidCallback? onPressed;

  final bool hasIcon;

  final String title;

  const CustomTitle({Key? key, this.onPressed, required this.title, this.hasIcon = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:hasIcon ? onPressed : null ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(text: title, color: colorPrimary, fontWeight: FontWeight.w700).paddingOnly(bottom: 12),
          hasIcon ? SvgPicture.asset("assets/images/arrow.svg") : const SizedBox()
        ],
      ),
    );
  }
}
