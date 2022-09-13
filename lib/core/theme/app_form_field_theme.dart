import 'package:challange_project/core/_core_export.dart';

class AppFormFieldTheme {
  static InputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.sp),
    borderSide: const BorderSide(color: AppColors.red, width: 1),
  );

  static InputBorder normalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.sp),
    borderSide: const BorderSide(color: Colors.grey, width: 1),
  );
}
