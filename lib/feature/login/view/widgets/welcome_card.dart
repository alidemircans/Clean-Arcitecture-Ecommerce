import 'package:challange_project/core/_core_export.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: .45.sh,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const NetworkImage(
            AppImagePaths.welcomeBackImage,
          ),
          colorFilter: ColorFilter.mode(
              AppColors.saltBlack.withOpacity(.7), BlendMode.darken),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextStyleGenerator(
              text: AppStringConstants.loginWelcomeText,
              style: AppTextStyles.body18Smooth.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            Container(
              color: AppColors.blue,
              margin: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: TextStyleGenerator(
                  text: AppStringConstants.loginCompanyNameText,
                  style: AppTextStyles.body18Smooth),
            )
          ],
        ),
      ),
    );
  }
}
