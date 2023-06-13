import 'package:art_core/theme/app_colors.dart';
import 'package:art_core/widgets/custom_snackbar.dart';
import 'package:art_core/widgets/text/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InvitationLink extends StatelessWidget {
  final String link ;
  const InvitationLink({super.key,required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.primaryColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(text: 'invitation_link'.tr(), fontSize: 15, height: 1),
          InkWell(
            onTap: () async {

                await Clipboard.setData(ClipboardData(text:link));
                showSnackBar('link_copied_in_clipboard'.tr());

            },
            child: const Icon(Icons.copy , color: AppColors.primaryColor , size: 20,),
          )
        ],
      ),
    );
  }
}
