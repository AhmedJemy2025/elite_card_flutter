// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:easy_localization/easy_localization.dart';
// import '../widgets/custom_snackbar.dart';
//
// class DownloadImage {
//   static Future<void> download(String imageUrl) async {
//     try {
//       CachedNetworkImageProvider(imageUrl)
//           .resolve(const ImageConfiguration())
//           .addListener(
//             ImageStreamListener(
//               (ImageInfo imageInfo, bool synchronousCall) async {
//                 // Get the bytes of the downloaded image
//                 final bytes = await imageInfo.image
//                     .toByteData(format: ImageByteFormat.png);
//                 if (bytes != null) {
//                   // Save the image to the gallery
//                   await ImageGallerySaver.saveImage(bytes.buffer.asUint8List());
//
//                   // Show a success message
//
//                   showSnackBar('file_downloaded_successfully'.tr());
//                 }
//               },
//               onError: (dynamic error, StackTrace? stackTrace) {
//                 // Show an error message
//                 showSnackBar('file_downloaded_failed'.tr());
//               },
//             ),
//           );
//     } catch (error) {
//       // Show an error message
//       showSnackBar("${'file_downloaded_failed'.tr()} $error ");
//     }
//   }
// }
