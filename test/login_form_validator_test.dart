import 'package:challange_project/core/constants/app_string_constats.dart';
import 'package:challange_project/feature/_feature_export.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LoginViewModel loginViewModel;

  setUp(() {
    loginViewModel = LoginViewModel();
  });
  test("empty username returns error string ", () {
    var result = loginViewModel.userNameValidator('');
    expect(result, AppStringConstants.userNameNullAlertText);
  });

  test("non-empty username returns null ", () {
    var result = loginViewModel.userNameValidator('username');
    expect(result, null);
  });

  test("empty passowrd returns error string ", () {
    var result = loginViewModel.passwordValidator('');
    expect(result, AppStringConstants.passwordNullAlertText);
  });
  test("true type passowrd returns null ", () {
    var result = loginViewModel.passwordValidator('LogiwaL!3578*');
    expect(result, null);
  });

  test("if password doesnt include some fields returns error string ", () {
    var result = LoginViewModel().passwordRegexValidator('');
    expect(result, AppStringConstants.passwordWrongTypeAlertText);
  });
}
