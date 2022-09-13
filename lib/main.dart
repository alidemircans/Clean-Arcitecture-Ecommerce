import 'package:challange_project/core/_core_export.dart';
import 'package:challange_project/feature/_feature_export.dart';
import 'core/utils/router.dart' as router;
import 'core/init/injection_container.dart' as dependencyInjection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection.init();

  runApp(const RunApp());
}

class RunApp extends StatelessWidget {
  const RunApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      child: ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: LoginView(),
      ),
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: GlobalContextKey.instance.globalKey,
          onGenerateRoute: router.generateRoute,
          scaffoldMessengerKey: snackbarKey,
          showSemanticsDebugger: false,
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          title: 'Flutter Challange',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: child,
        );
      },
    );
  }
}
