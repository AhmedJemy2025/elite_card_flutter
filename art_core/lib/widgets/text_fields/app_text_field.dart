import 'package:art_core/art_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppTextField extends StatefulWidget {
  final bool? readOnly;
  final int? maxLines;
  final String? label;
  final String? hint;
  final TextStyle? hintStyle;
  final bool isSelectable;

  final bool darkOrAuth;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  final String? errorText;
  final Color? borderColor;
  final Color? labelColor;

  final bool isPassword;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  final int? maxLength;

  var onTap;

  final String? initialText;

  final double contentPaddingVertical;

  final Color? fillColor;
  final bool? filled;
  final bool? enableBorder;

  AppTextField({
    Key? key,
    this.readOnly = false,
    this.maxLines = 1,
    this.onTap,
    this.hint,
    this.label,
    this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.darkOrAuth = false,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.errorText,
    this.initialText,
    this.borderColor,
    this.hintStyle,
    this.isSelectable = false,
    this.controller,
    this.maxLength,
    this.contentPaddingVertical = 15,
    this.fillColor,
    this.filled,
    this.labelColor,
    this.enableBorder = true,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofocus: false,
      onTap: widget.onTap ?? () {},
      initialValue: widget.initialText,
      enabled: true,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly ?? false,
      maxLines: widget.maxLines,
      keyboardType: widget.textInputType,
      obscureText: widget.isPassword == true ? obscureText : false,
      maxLength: widget.maxLength,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15 ),
      decoration: InputDecoration(
          fillColor: widget.fillColor,
          filled: widget.filled,
          border: widget.enableBorder == false
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4))
              : Theme.of(context).inputDecorationTheme.border?.copyWith(
                  borderSide:
                      BorderSide(color: widget.borderColor ?? Colors.black)),
          disabledBorder: widget.enableBorder == false
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4))
              : Theme.of(context).inputDecorationTheme.disabledBorder?.copyWith(
                  borderSide:
                      BorderSide(color: widget.borderColor ?? Colors.black)),
          enabledBorder: widget.enableBorder == false
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4))
              : Theme.of(context).inputDecorationTheme.enabledBorder?.copyWith(
                  borderSide:
                      BorderSide(color: widget.borderColor ?? Colors.black)),
          focusedBorder: widget.enableBorder == false
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4))
              : Theme.of(context).inputDecorationTheme.focusedBorder?.copyWith(
                  borderSide:
                      BorderSide(color: widget.borderColor ?? Colors.black)),
          focusedErrorBorder: widget.enableBorder == false
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4))
              : Theme.of(context).inputDecorationTheme.focusedErrorBorder,
          errorBorder: widget.enableBorder == false
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4))
              : Theme.of(context).inputDecorationTheme.errorBorder,
          contentPadding: EdgeInsets.symmetric(
              vertical: widget.contentPaddingVertical, horizontal: 12),
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: widget.labelColor ?? Colors.black,
              fontWeight: FontWeight.w100),
          labelText: widget.label,
          alignLabelWithHint: true,

          labelStyle: TextStyle(
              color: widget.labelColor ?? Colors.black,
              fontWeight: FontWeight.w500),
          errorText: widget.errorText == null ||
                  widget.errorText!.isEmpty ||
                  widget.errorText == ''
              ? null
              : widget.errorText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon ??
              (widget.isPassword
                  ? InkWell(
                      onTap: () {
                        obscureText = !obscureText;
                        setState(() {});
                      },
                      child: SvgPicture.asset(
                        !obscureText
                            ? "assets/images/eye_on.svg"
                            : "assets/images/eye_off.svg",
                        height: 25,
                        width: 25,
                        color: AppColors.primaryColor,
                      ).paddingSymmetric(horizontal: 15))
                  : widget.isSelectable
                      ? const Icon(Icons.arrow_drop_down_rounded, color: AppColors.primaryColor)
                      : const SizedBox())),

      // textDirection: TextDirection.ltr,
      // cursorColor: AppColors.primaryColorLight,
    );
  }
}
