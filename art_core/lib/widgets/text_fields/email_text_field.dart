// import 'package:intercome_app/core/extensions/email.dart';
// import 'package:intercome_app/core/theme/themes.dart';
//
// class AppEmailTextField extends StatefulWidget {
//   final bool? readOnly;
//   final int? maxLines;
//   final TextEditingController controller;
//   final bool darkOrAuth;
//   final String? label;
//
//   const AppEmailTextField({
//     Key? key,
//     required this.controller,
//     this.readOnly = false,
//     this.darkOrAuth = false,
//     this.label,
//
//     this.maxLines = 1,
//   }) : super(key: key);
//   static const double _radius = 10;
//   static const double _width1_5 = 1.5;
//
//   @override
//   State<AppEmailTextField> createState() => _AppEmailTextFieldState();
// }
//
// class _AppEmailTextFieldState extends State<AppEmailTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       readOnly: widget.readOnly ?? false,
//       maxLines: widget.maxLines,
//       style: _textStyle,
//       keyboardType: TextInputType.emailAddress,
//       decoration: widget.darkOrAuth == true
//           ? TextFieldThemes.darkDecoration.copyWith(
//           hintText: widget.label,
//       )
//           : TextFieldThemes.lightDecoration.copyWith(
//         hintText: widget.label,
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter some text';
//         } else {
//           if (value.toString().isEmail() == false) {
//             return 'Email is Not Valid';
//           } else {
//             return null;
//           }
//         }
//       },
//       enabled: true,
//     );
//   }
//
//   final TextStyle _textStyle = const TextStyle(color: AppColors.offWhite);
// }
