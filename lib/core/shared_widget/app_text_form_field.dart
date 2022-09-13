import 'package:challange_project/core/_core_export.dart';

// ignore: must_be_immutable
class AppFormField extends StatelessWidget {
  AppFormField({
    Key? key,
    this.labelText,
    this.title,
    this.maxLines,
    this.maxLength,
    this.textEditingController,
    this.onFieldComplete,
    this.onFieldSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.isObscure = false,
    this.enabled,
    this.focusNode,
    this.toolbarOptions,
    this.autoFocus = false,
    this.autovalidateMode,
    this.additionalInputFormatters,
    this.justUseTheAdditionalInputFormatters = false,
    this.isRequired = true,
    this.suffixIcon,
    this.textAlign,
    this.floatingLabelAlignment,
  }) : super(key: key);
  String? title;
  bool isRequired;
  Function()? onTap;
  String? labelText;
  int? maxLines;
  int? maxLength;
  TextEditingController? textEditingController;
  Function()? onFieldComplete;
  Function(String)? onFieldSubmitted;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  bool? isObscure;
  bool? enabled;
  FocusNode? focusNode;
  ToolbarOptions? toolbarOptions;
  bool? autoFocus;
  AutovalidateMode? autovalidateMode;
  List<TextInputFormatter>? additionalInputFormatters;
  bool? justUseTheAdditionalInputFormatters;
  Widget? suffixIcon;
  TextAlign? textAlign;
  FloatingLabelAlignment? floatingLabelAlignment;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        TextFormField(
          inputFormatters: justUseTheAdditionalInputFormatters != null &&
                  justUseTheAdditionalInputFormatters!
              ? additionalInputFormatters!
              : [
                  if (additionalInputFormatters != null)
                    ...additionalInputFormatters!,
                  if (keyboardType == TextInputType.phone)
                    LengthLimitingTextInputFormatter(10),
                  if (keyboardType == TextInputType.number ||
                      keyboardType == TextInputType.phone)
                    FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(maxLength),
                ],
          keyboardType: keyboardType,
          enabled: enabled,
          autofocus: autoFocus!,
          focusNode: focusNode,
          onEditingComplete: onFieldComplete,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          cursorColor: AppColors.saltBlack,
          controller: textEditingController,
          validator: validator,
          onChanged: onChanged,
          toolbarOptions: toolbarOptions,
          autovalidateMode: autovalidateMode,
          maxLines: maxLines,
          maxLength: maxLength,
          obscureText: isObscure!,
          textAlign: textAlign ?? TextAlign.start,
          maxLengthEnforcement:
              MaxLengthEnforcement.truncateAfterCompositionEnds,
          decoration: InputDecoration(
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            alignLabelWithHint: false,
            labelText: labelText,
            floatingLabelAlignment:
                floatingLabelAlignment ?? FloatingLabelAlignment.start,
            labelStyle: AppTextStyles.body18Smooth.copyWith(
              fontSize: 12.sp,
              color: AppColors.saltBlack,
              fontWeight: FontWeight.w900,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            counterStyle: const TextStyle(color: AppColors.secondaryColor),
            enabledBorder: AppFormFieldTheme.normalBorder,
            errorBorder: AppFormFieldTheme.errorBorder,
            focusedErrorBorder: AppFormFieldTheme.errorBorder,
            disabledBorder: AppFormFieldTheme.normalBorder,
            focusedBorder: AppFormFieldTheme.normalBorder,
            border: AppFormFieldTheme.normalBorder,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
