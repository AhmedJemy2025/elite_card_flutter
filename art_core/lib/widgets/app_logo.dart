import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;

      return  SvgPicture.asset("assets/images/logo.svg", height: height / 6) ;

    // if (Modular.get<PreferenceManager>().isDarkMode()){
    //   return SvgPicture.asset("assets/images/dark_mode_logo.svg", height: height / 6);
    // }else {
    // }
  }
}
