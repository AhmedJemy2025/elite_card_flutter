// import 'package:intercome_app/core/theme/themes.dart';
//
// class AppPasswordTextField extends StatelessWidget {
//   final bool? readOnly;
//   final int? maxLines;
//   final String? label;
// final bool ? dark ;
//   final TextEditingController controller;
//   final TextInputType? textInputType;
//
//   const AppPasswordTextField(
//       {Key? key,
//       required this.controller,
//       this.readOnly = false,
//       this.maxLines = 1,
//       this.label,
//       this.textInputType,
//       this.dark = false
//       })
//       : super(key: key);
//   static const double _radius = 10;
//   static const double _width1_5 = 1.5;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       readOnly: readOnly ?? false,
//       maxLines: maxLines,
//       style: _textStyle,
//       keyboardType: textInputType,
//
//       decoration: dark == true ? TextFieldThemes.darkDecoration : TextFieldThemes.lightDecoration,
//
//
//
//       enabled: true,
//     );
//   }
//
//   final TextStyle _textStyle = const TextStyle(color: AppColors.offWhite);
// }
