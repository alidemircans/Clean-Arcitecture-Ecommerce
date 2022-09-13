import 'package:challange_project/core/_core_export.dart';
import 'package:challange_project/feature/_feature_export.dart';

class ProductViewModel extends ChangeNotifier {
  //product model
  Product? product;

  //enums
  AddProductEnum addProductEnum = AddProductEnum.Idle;
  //keys
  final GlobalKey<FormState> formKey = GlobalKey();

  //controllers
  final TextEditingController textEditingControllerProductName =
      TextEditingController();
  final TextEditingController textEditingControllerItemCode =
      TextEditingController();
  final TextEditingController textEditingControllerQuatity =
      TextEditingController();
  final TextEditingController textEditingControllerLocationCode =
      TextEditingController();

  //validators
  String? productNameValidator(final String? value) {
    if (textEditingControllerProductName.text.trim().isEmpty) {
      return AppStringConstants.productNameNullAlertText;
    }
    return null;
  }

  String? itemCodeValidator(final String? value) {
    if (textEditingControllerItemCode.text.trim().isEmpty) {
      return AppStringConstants.itemCodeNullAlertText;
    }
    return null;
  }

  String? quantityValidator(final String? value) {
    if (textEditingControllerQuatity.text.trim().isEmpty) {
      return AppStringConstants.quantityNullAlertText;
    }
    return null;
  }

  String? loactionCodeValidator(final String? value) {
    if (textEditingControllerLocationCode.text.trim().isEmpty) {
      return AppStringConstants.locationCodeNullAlertText;
    }
    return null;
  }

  //actions
  increaseQuantity() {
    if (textEditingControllerQuatity.text == "") {
      textEditingControllerQuatity.text = "1";
      notifyListeners();
      return;
    }
    textEditingControllerQuatity.text =
        (int.parse(textEditingControllerQuatity.text) + 1).toString();
    notifyListeners();
  }

  decreaseQuantity() {
    if (textEditingControllerQuatity.text == "") {
      textEditingControllerQuatity.text = "0";
      notifyListeners();
      return;
    }
    if (textEditingControllerQuatity.text == "0") {
      AppSnackBar.showSnackBar(AppStringConstants.quantityZeroAlertText);
      return;
    }
    textEditingControllerQuatity.text =
        (int.parse(textEditingControllerQuatity.text) - 1).toString();
    notifyListeners();
  }

  Future<void> scanBarcode() async {
    try {
      textEditingControllerItemCode.text =
          await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      increaseQuantity();
    } on PlatformException {
      AppSnackBar.showSnackBar("Failed to get platform version.");
    }

    notifyListeners();
  }

  Future<bool?> saveProduct() async {
    bool? isValid = formKey.currentState?.validate();

    if (isValid != null && isValid) {
      setProduct(
        textEditingControllerProductName.text,
        textEditingControllerItemCode.text,
        textEditingControllerQuatity.text,
        textEditingControllerLocationCode.text,
      );
      notifyListeners();
      Go.to.pageAndRemoveUntil(AppRoutes.PRODUCT_DETAIL_PAGE);
      return isValid;
    }
    return isValid;
  }

  setProduct(String? productName, String? itemCode, String quantity,
      String locationCode) {
    product = Product(
      quantity: int.parse(quantity),
      productName: productName,
      itemCode: itemCode,
      locationCode: locationCode,
    );
  }

  clearDatas() {
    product = null;
    textEditingControllerProductName.clear();
    textEditingControllerItemCode.clear();
    textEditingControllerQuatity.clear();
    textEditingControllerLocationCode.clear();
  }

  removeProduct() {
    clearDatas();
    notifyListeners();
    Go.to.pageAndRemoveUntil(AppRoutes.ADD_PRODUCT_PAGE);
  }

  editProduct() {
    Go.to.pageAndRemoveUntil(AppRoutes.ADD_PRODUCT_PAGE);
  }
}
