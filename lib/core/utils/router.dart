import 'package:challange_project/core/_core_export.dart';
import 'package:challange_project/feature/_feature_export.dart';

import 'package:flutter/cupertino.dart';

Route<dynamic> generateRoute(final RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.LOGIN:
      return CupertinoPageRoute(builder: (final _) => LoginView());
    case AppRoutes.ADD_PRODUCT_PAGE:
      return CupertinoPageRoute(
          builder: (final _) => ChangeNotifierProvider<ProductViewModel>.value(
                value: serviceLocator.get<ProductViewModel>(),
                child: const AddProductPage(),
              ));
    case AppRoutes.PRODUCT_DETAIL_PAGE:
      return CupertinoPageRoute(
          builder: (final _) => ChangeNotifierProvider<ProductViewModel>.value(
                value: serviceLocator.get<ProductViewModel>(),
                child: const ProductDetailPage(),
              ));
    default:
      return MaterialPageRoute(builder: (final _) => SizedBox());
  }
}
