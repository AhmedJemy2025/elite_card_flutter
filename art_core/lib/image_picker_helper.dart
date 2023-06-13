import 'dart:io';

import 'package:art_core/art_core.dart';
import 'package:art_core/widgets/extensions/widgets_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  Future<File> openCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    File _image = File(image!.path);
    return _image;
  }

  Future<File> openGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    File _image = File(image!.path);
    return _image;
  }

  void showChooseImageBottomSheet(Function onSelectImage) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: Modular.routerDelegate.navigatorKey.currentContext!,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(text: "select_image_source".tr()).paddingOnly(top: 20),
              TextButton(
                onPressed: () async {
                  File image = await openCamera();
                  onSelectImage(image.path);
                },
                child: AppText(text: "from_camera".tr()),
              ),
              const Divider(),
              TextButton(
                      onPressed: () async {
                        File image = await openGallery();
                        onSelectImage(image.path);
                      },
                      child: AppText(text: "from_gallery".tr()))
                  .paddingOnly(bottom: 20)
            ],
          );
        });
  }
}
