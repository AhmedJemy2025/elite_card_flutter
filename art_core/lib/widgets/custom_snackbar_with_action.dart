import 'package:art_core/art_core.dart';
import 'package:flutter_modular/flutter_modular.dart';

void showSnackBarWithAction(String text,{bool isError = false , required String actionText ,required Function onActionClick }) {
  ScaffoldMessenger.of(
    Modular.routerDelegate.navigatorKey.currentContext!,
  ).showSnackBar(SnackBar(
    content: AppText(
      text: text,
      color: colorWhite,
    ),
    action: SnackBarAction(label: actionText,textColor: colorWhite,onPressed: (){
      onActionClick();
    },),
    backgroundColor:isError ? AppColors.red:colorPrimary,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    duration: const Duration(seconds: 3),
  ));

}
