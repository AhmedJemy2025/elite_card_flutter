import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const SearchTextField({Key? key,  this.controller, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      enabled: true,
      onChanged: onChanged,
      style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500, fontSize: 15),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          hintText: "search".tr(),
          alignLabelWithHint: true,
          labelStyle: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500),
          prefixIcon: const Icon(Icons.search, color: AppColors.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.transparent)
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.transparent)
        ),
        disabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.transparent)
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.transparent)
        ) ,
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.transparent)
        ),
        fillColor: const Color(0xFF6161601A).withOpacity(0.1),
        filled: true
      ),
      // cursorColor: AppColors.primaryColorLight,
    );
  }
}
