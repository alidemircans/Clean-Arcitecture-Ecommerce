import 'package:challange_project/core/_core_export.dart';

class LoginViewModel extends ChangeNotifier {
  // enums
  LoginEnum loginEnum = LoginEnum.Idle;

  // keys
  final GlobalKey<FormState> formKey = GlobalKey();

  // controllers
  final TextEditingController textEditingControllerUsername =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();

  //validators
  String? userNameValidator(final String? value) {
    if (value!.trim().isEmpty) {
      return AppStringConstants.userNameNullAlertText;
    }
    return null;
  }

  String? passwordValidator(final String? value) {
    if (value!.trim().isEmpty) {
      return AppStringConstants.passwordNullAlertText;
    }
    passwordRegexValidator(value);

    return null;
  }

  String? passwordRegexValidator(final String? value) {
    if (!AppRegex.passwordRegex.hasMatch(textEditingControllerPassword.text)) {
      return AppStringConstants.passwordWrongTypeAlertText;
    }
    return null;
  }
  // actions

  Future<void> loginControl() async {
    bool? isValid = formKey.currentState?.validate();
    if (isValid != null && isValid) {
      login();
    }
  }

  Future<void> login() async {
    loginEnum = LoginEnum.Loading;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (textEditingControllerPassword.text.trim() == "LogiwaL!3578*") {
        
        Go.to.page(AppRoutes.ADD_PRODUCT_PAGE);
      } else {
        AppSnackBar.showSnackBar(
            AppStringConstants.userNameOrPasswordWrongAlertText);
      }

      loginEnum = LoginEnum.Idle;
    } catch (e) {
      loginEnum = LoginEnum.Error;
    }
    notifyListeners();
  }
}
