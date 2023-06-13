import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../theme/app_colors.dart';

class LoadingView extends StatelessWidget {
  final bool isButton;
  final Color? color ;

  const LoadingView({Key? key, this.isButton = false, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isButton ? const Color.fromARGB(255, 245, 245, 245) : null,
      child: Center(
        child: ColorFiltered(
          colorFilter:ColorFilter.mode( color == null ? AppColors.primaryColor: color!, BlendMode.srcIn) ,
          child: Lottie.asset(
            'assets/loading.json',
            repeat: true,
          ),
        ),
      ),
    );
  }
}
