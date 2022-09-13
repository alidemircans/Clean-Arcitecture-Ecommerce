import 'package:challange_project/core/_core_export.dart';
import 'package:challange_project/feature/_feature_export.dart';

class AddProductForm extends StatelessWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: .8.sh,
      child: Consumer<ProductViewModel>(
        builder: (context, viewModel, _) => Form(
          key: viewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(top: 32..h, left: 16.w, right: 16.w),
                    child: TextStyleGenerator(
                      text: AppStringConstants.addProduct,
                      style: AppTextStyles.body12Bold.copyWith(),
                    ),
                  ),
                  16.h.verticalSpace,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppFormField(
                      labelText: AppStringConstants.productName,
                      textEditingController:
                          viewModel.textEditingControllerProductName,
                      validator: viewModel.productNameValidator,
                    ),
                  ),
                  16.h.verticalSpace,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppFormField(
                      labelText: AppStringConstants.itemCode,
                      textEditingController:
                          viewModel.textEditingControllerItemCode,
                      validator: viewModel.itemCodeValidator,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          viewModel.scanBarcode();
                        },
                        child: const Icon(
                          Icons.qr_code_scanner,
                          color: AppColors.saltBlack,
                        ),
                      ),
                    ),
                  ),
                  16.h.verticalSpace,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            viewModel.decreaseQuantity();
                          },
                          child: Container(
                            width: 48.h,
                            height: 36.h,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: const Icon(
                              Icons.remove,
                            ),
                          ),
                        ),
                        8.horizontalSpace,
                        SizedBox(
                          width: .3.sw,
                          child: AppFormField(
                              labelText: AppStringConstants.quantity,
                              textEditingController:
                                  viewModel.textEditingControllerQuatity,
                              validator: viewModel.quantityValidator,
                              textAlign: TextAlign.center,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              keyboardType: TextInputType.number),
                        ),
                        8.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            viewModel.increaseQuantity();
                          },
                          child: Container(
                            width: 48.h,
                            height: 36.h,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.h.verticalSpace,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppFormField(
                      labelText: AppStringConstants.locationCode,
                      textEditingController:
                          viewModel.textEditingControllerLocationCode,
                      validator: viewModel.loactionCodeValidator,
                    ),
                  ),
                ],
              ),
              AppButton(
                child: viewModel.addProductEnum == AddProductEnum.Adding
                    ? const SizedBox(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : TextStyleGenerator(
                        text: AppStringConstants.save,
                        style: AppTextStyles.body18Smooth,
                      ),
                onTap: () {
                  viewModel.saveProduct();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
