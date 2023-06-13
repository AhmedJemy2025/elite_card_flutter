import 'package:art_core/art_core.dart';
import 'package:art_core/widgets/extensions/widgets_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SectionLabel extends StatelessWidget {
  final String label;

  final VoidCallback? onTap;
  final bool hasSeeAll;

  final bool hasIcon;

  final String? subLabel;

  final double? fontLabel;
  final double? fontSubLabel;
  final VoidCallback? onArrowPressed;
  final bool hasArrow;

  final FontWeight? fontWeight;
  final Color? colorLabel;

  final Color? colorSubLabel;
  final bool isCentered;

  const SectionLabel(
      {Key? key,
      required this.label,
      this.onTap,
      this.hasSeeAll = true,
      this.hasIcon = false,
      this.subLabel,
      this.fontLabel,
      this.fontSubLabel,
      this.hasArrow = false,
      this.onArrowPressed,
      this.fontWeight,
      this.colorLabel,
      this.colorSubLabel,  this.isCentered = false,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onArrowPressed,
      child: Row(
        mainAxisAlignment: isCentered ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isCentered) ...[
            SvgPicture.asset("assets/icons/ic_label.svg" , height: 30,width: 20,),
          ],
          AppText(text: label, fontSize: fontLabel ?? 16, fontWeight: fontWeight, color: colorLabel),
          if (hasArrow) ...[
            SvgPicture.asset("assets/images/arrow_down.svg").paddingOnly(top: 5),
            const Spacer(),
          ],
          if (hasSeeAll) ...[
            TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 0)),
              onPressed: onTap ?? () {},
              child: Row(
                children: [
                  if (hasIcon) ...[
                    AppText(
                      text: subLabel ?? "see_all".tr(),
                      fontSize: fontSubLabel ?? 16,
                      color: colorSubLabel ?? AppColors.primaryColor,
                      height: 1.7,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.greyText,
                      size: 12,
                    )
                  ] else ...[
                    AppText(text: subLabel ?? "see_all".tr(), fontSize: fontSubLabel ?? 16, color: colorSubLabel ?? AppColors.primaryColor),
                  ]
                ],
              ),
            )
          ]
        ],
      ),
    );
  }
}
