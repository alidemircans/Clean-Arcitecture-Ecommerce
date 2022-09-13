import 'package:challange_project/core/_core_export.dart';

class AppSnackBar {
  static showSnackBar(title) {
    snackbarKey.currentState
        ?.showSnackBar(SnackBar(content: TextStyleGenerator(text: title)));
  }
}
