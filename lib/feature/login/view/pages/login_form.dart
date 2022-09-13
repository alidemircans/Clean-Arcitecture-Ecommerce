import 'package:challange_project/core/_core_export.dart';
import 'package:challange_project/feature/_feature_export.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: .4.sh,
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) => Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              16.h.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: AppFormField(
                  labelText: AppStringConstants.username,
                  textEditingController:
                      viewModel.textEditingControllerUsername,
                  validator: viewModel.userNameValidator,
                ),
              ),
              16.h.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: AppFormField(
                  labelText: AppStringConstants.password,
                  textEditingController:
                      viewModel.textEditingControllerPassword,
                  validator: viewModel.passwordValidator,
                ),
              ),
              22.h.verticalSpace,
              AppButton(
                child: viewModel.loginEnum == LoginEnum.Loading
                    ? const SizedBox(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : TextStyleGenerator(
                        text: AppStringConstants.login,
                        style: AppTextStyles.body18Smooth,
                      ),
                onTap: () {
                  viewModel.loginControl();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
