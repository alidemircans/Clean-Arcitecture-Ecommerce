import 'package:challange_project/core/_core_export.dart';

class AppBaseAsset extends StatelessWidget {
  final String iconPath;
  final double height;
  final Color? iconColor;
  const AppBaseAsset(
      {final Key? key,
      required this.iconPath,
      this.height = 24,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(final BuildContext context) => Image.asset(
        iconPath,
        color: iconColor,
        height: height,
      );
}
