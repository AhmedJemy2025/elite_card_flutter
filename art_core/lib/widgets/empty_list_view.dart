import 'package:art_core/art_core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyListView extends StatelessWidget {
  final String? title;
  final String? titleButton;
  final bool withButton;
  final VoidCallback? tap;
  final bool smallView;

  const EmptyListView(
      {super.key, this.title, this.withButton = false, this.tap, this.titleButton, this.smallView = false});


  @override
  Widget build(BuildContext context) {
    String _title = "something_went_wrong".tr();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        smallView ? _emptyListWidgetSmall(title: title ?? _title) : _emptyListWidget(title: title ?? _title),
        SizedBox(
          height: smallView ? 15 : 30,
        ),
        withButton ? AppButton(title: titleButton ?? 'add'.tr(), onTap: tap ?? () {}) : const SizedBox(),
      ],
    );
  }

  Widget _emptyListWidget({String? title}) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset('assets/icons/empty_list.svg',height: 180,width: 180,color: AppColors.primaryColor,),
          const SizedBox(
            height: 8,
          ),
          AppText(
            text: title! ,
            fontSize: 16,
            maxLines: 5,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  Widget _emptyListWidgetSmall({String? title}) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset('assets/icons/empty_list.svg', height: 90,color: AppColors.primaryColor),
          const SizedBox(
            height: 8,
          ),
          AppText(
            text: title! ,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
