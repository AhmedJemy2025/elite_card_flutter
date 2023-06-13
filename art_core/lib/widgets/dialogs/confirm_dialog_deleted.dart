import 'package:art_core/art_core.dart';
import 'package:art_core/widgets/extensions/widgets_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback onDelete;
  final String ?title ;

  const DeleteDialog({super.key, required this.onDelete,this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(alignment: Alignment.center, child: Image.asset("assets/images/Group 764.png")),
            Align(
              alignment: Alignment.center,
              child:   AppText(
                text: title ??"Are You Sure you Want Delete?",
                textAlign: TextAlign.center,
                fontSize: 16,
                maxLines: 3,
                fontWeight: FontWeight.bold,
              ).paddingOnly(bottom: 15),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      horizontalPadding: 10,
                      height: 50,
                      title: 'No'.tr(),
                      color: AppColors.primaryColor,
                      onTap: () => Modular.to.pop(),
                    ),
                  ),
                  Expanded(
                    child: AppButton(
                      horizontalPadding: 10,
                      height: 50,
                      title: 'Yes'.tr(),
                      color: AppColors.pink,
                      textColor: AppColors.red,
                      onTap: onDelete,
                    ),
                  ),
                ],
              ).marginSymmetric(horizontal: 15),
            )
          ],
        ),
      ),
    );
  }
}
