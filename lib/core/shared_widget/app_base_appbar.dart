import 'package:challange_project/core/_core_export.dart';

class AppBaseAppBar extends StatelessWidget with PreferredSizeWidget {
  const AppBaseAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.saltWhite,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: const AppBaseAsset(iconPath: AppImagePaths.appLogo),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.h);
}
