import 'package:art_core/art_core.dart';
import 'package:art_core/widgets/extensions/widgets_extensions.dart';
import 'package:core/cache/cache.dart';
import 'package:core/router/navigator_keys.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  dynamic title;
  final bool hasLogo;
  final bool hasLeadingImage;

  final bool hasBack;
  final bool? centerTitle;
  final bool hasNotifications;
  final VoidCallback? onBack;
  final String fontFamily;

  final Widget? leadingWidgets;

  DefaultAppBar({
    Key? key,
    this.title,
    this.hasLogo = false,
    this.hasBack = true,
    this.hasLeadingImage = false,
    this.centerTitle,
    this.hasNotifications = true,
    this.onBack,
    this.leadingWidgets,  this.fontFamily = 'GE',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark
      ),
        backgroundColor: Colors.black,
        elevation: 3,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey[200],
        titleSpacing: hasLeadingImage ? 0 : 20,
        automaticallyImplyLeading: false,
        // iconTheme: const IconThemeData(size: 20),
        leading: hasBack
            ? InkWell(
                onTap: onBack ??
                    () {
                      if (Modular.to.canPop()) {
                        Modular.to.pop();
                      } else {}
                    },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: colorPrimary,
                  size: 20,
                ))
            : (hasLeadingImage)
                ? IconButton(
                    iconSize: 10,
                    padding: EdgeInsets.zero,
                    onPressed: () => Modular.to.pushNamed(NavigatorKeys.AUTH_KEY + NavigatorKeys.PROFILE),
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor.withOpacity(0.8),
                        // image: DecorationImage(image: NetworkImage(Modular.get<PreferenceManager>().userModel().image), fit: BoxFit.cover),
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 10)
                : null,
        actions: [
          if (leadingWidgets != null) ...[
            leadingWidgets!,
          ],
          if (hasNotifications)
            InkWell(
                    onTap: () {
                       Modular.to.pushNamed(NavigatorKeys.NOTIFICATIONS_KEY +NavigatorKeys.NOTIFICATIONS_PAGE  );
                    },
                    child: SvgPicture.asset("assets/images/notifications.svg", height: 24))
                .paddingSymmetric(horizontal: 10)
        ],
        centerTitle: centerTitle,
        title: hasLogo
            ? SvgPicture.asset("assets/images/logo.svg", height: 45,color: Colors.white)
            : title is String
                ? AppText(text: title!, fontSize: 18,color: AppColors.white,fontFamily: fontFamily,fontWeight: FontWeight.w400,)
                : title is Widget
                    ? title
                    : null);
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
