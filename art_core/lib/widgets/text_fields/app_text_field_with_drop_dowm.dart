
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/styles.dart';
import '../../theme/widget_theme/text_field_themes.dart';
import '../text/app_text.dart';

class AppTextFieldWithDropDown<T> extends StatelessWidget {
  final int? maxLines;
  final String? label;
  final String? hint;
  final List<T> options;
  final bool darkOrAuth;
  final bool readOnly;
  final String? Function(T?)? validator;
  final Function(T?)? onChanged;
  final String? errorText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final T? value;
  final T? initialText;
  final String Function(T)? getLabel;

  const AppTextFieldWithDropDown(
      {Key? key,
      this.maxLines = 1,
      this.hint,
      this.options = const [],
      this.initialText,
      this.label,
      this.textInputType,
      this.suffixIcon,
      this.darkOrAuth = false,
      this.validator,
      this.onChanged,
      this.getLabel,
      this.errorText,
        this.readOnly = false ,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      initialValue: initialText,
      enabled: true,
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          // decoration: darkOrAuth == true ?
          decoration: TextFieldThemes.lightDecoration.copyWith(
            hintText: hint,
            labelText: label,
            contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            labelStyle: TextStyle(color: colorPrimary,fontWeight: FontWeight.normal),
            errorText: errorText == null || errorText!.isEmpty || errorText == '' ? null : errorText,
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isDense: true,
              onChanged: onChanged,
              style: _textStyle(),
              // dropdownColor: darkOrAuth == true ?
              dropdownColor: colorWhite,
              // : AppColors.offWhite.shade200,
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  //  enabled: false,
                  child: AppText(
                      text: getLabel!(value),
                      color:
                          // darkOrAuth == true ? AppColors.offWhite :
                          AppColors.primaryColorLight),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  TextStyle _textStyle() {
    return darkOrAuth == true
        ? const TextStyle(color: AppColors.offWhite)
        : const TextStyle(color: AppColors.primaryColorLight);
  }
}
