import 'package:challange_project/core/_core_export.dart';

class BackImageFit extends StatelessWidget {
  const BackImageFit({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImagePaths.backImage,
          ),
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
