import 'package:challange_project/core/_core_export.dart';
import 'package:challange_project/feature/_feature_export.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.buttonColor,
  }) : super(key: key);

  final Function() onTap;
  final Widget child;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
          color: buttonColor ?? AppColors.blue,
        ),
        height: 36.h,
        child: Center(child: child),
      ),
    );
  }
}
