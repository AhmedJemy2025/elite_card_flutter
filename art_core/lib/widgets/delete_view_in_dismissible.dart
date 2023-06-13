import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

Widget deleteView() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
    ),
    alignment: AlignmentDirectional.centerStart,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Container(
            height: double.maxFinite,
            width: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColors.pink),
            child: const Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: 30,
            ))),
  );
}
