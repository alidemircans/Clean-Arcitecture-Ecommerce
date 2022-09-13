import 'package:challange_project/core/_core_export.dart';
import 'package:challange_project/feature/_feature_export.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton(() => ProductViewModel());

  
}
