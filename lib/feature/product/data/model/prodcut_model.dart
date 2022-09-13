import 'package:challange_project/core/_core_export.dart';

class Product {
 String productImage = AppImagePaths.product;
  String? productName;
  int? quantity;
  String? itemCode;
  String? locationCode;

  Product({
    required this.quantity,
    required this.itemCode,
    required this.locationCode,
    required this.productName,
  });
}
