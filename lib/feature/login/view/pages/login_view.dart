import 'package:challange_project/core/_core_export.dart';
import 'package:challange_project/feature/_feature_export.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBaseAppBar(),
      body: BackImageFit(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const WelcomeCard(),
              18.h.verticalSpace,
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
