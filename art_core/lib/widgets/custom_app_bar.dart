// import 'package:art_core/widgets/text/app_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final bool hasLogo ;
//   final bool hasLeadingImage  ;
//   const CustomAppBar({Key? key,  this.title,this.hasLogo = false, this.hasLeadingImage = false })
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 3,
//       surfaceTintColor: Colors.white,
//       shadowColor: Colors.grey[200],
//       automaticallyImplyLeading: !hasLeadingImage,
//       iconTheme: IconThemeData(size: 20),
//       leading:hasLeadingImage? Container(
//         margin: EdgeInsets.symmetric(horizontal: 10),
//         height: 20,
//         width: 20,
//         decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/images/me.png"))),
//       ) : null ,
//       actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/images/notification.svg"))],
//       title:hasLogo? SvgPicture.asset("assets/images/logo.svg", height: 45): AppText(text: title!, fontSize: 16),
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(60);
//
// }
