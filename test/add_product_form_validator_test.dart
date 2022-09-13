import 'package:challange_project/core/constants/app_string_constats.dart';
import 'package:challange_project/feature/_feature_export.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProductViewModel _prodcutViewModel;

  setUp(() {
    _prodcutViewModel = ProductViewModel();
  });

  test("empty product  returns error string ", () {
    var result = _prodcutViewModel.productNameValidator("");
    expect(result, AppStringConstants.productNameNullAlertText);
  });
  test("empty item code  returns error string ", () {
    var result = _prodcutViewModel.itemCodeValidator("");
    expect(result, AppStringConstants.itemCodeNullAlertText);
  });
  test("empty quantity returns error string ", () {
    var result = _prodcutViewModel.quantityValidator("");
    expect(result, AppStringConstants.quantityNullAlertText);
  });
  test("empty location code returns error string ", () {
    var result = _prodcutViewModel.loactionCodeValidator("");
    expect(result, AppStringConstants.locationCodeNullAlertText);
  });

  test("clearDatas", () async {
    _prodcutViewModel.clearDatas();
    expect(_prodcutViewModel.product, null);
    expect(_prodcutViewModel.textEditingControllerProductName.text, "");
    expect(_prodcutViewModel.textEditingControllerItemCode.text, "");
    expect(_prodcutViewModel.textEditingControllerQuatity.text, "");
    expect(_prodcutViewModel.textEditingControllerLocationCode.text, "");
  });
  test("setProduct", () async {
    _prodcutViewModel.setProduct("Product Name","İtem Code","0","Location Code");
    expect(_prodcutViewModel.product is Product, true);
    expect(_prodcutViewModel.product != null, true);
    expect(_prodcutViewModel.product!.productName != null, true);
    expect(_prodcutViewModel.product!.itemCode != null, true);
    expect(_prodcutViewModel.product!.quantity != null, true);
    expect(_prodcutViewModel.product!.locationCode != null, true);
  });
}
