import 'package:challange_project/core/_core_export.dart';
import 'package:challange_project/feature/_feature_export.dart';

class ProductDetailCard extends StatelessWidget {
  const ProductDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, viewModel, _) => viewModel.product == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : SizedBox(
              height: 1.sh,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: .7.sh,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProductImageCard(viewModel),
                          _productFirstLine(viewModel),
                          4.h.verticalSpace,
                          _buildSubFiled(AppStringConstants.quantity,
                              viewModel.product!.quantity.toString()),
                          12.h.verticalSpace,
                          _buildSubFiled(
                            AppStringConstants.locationCode,
                            viewModel.product!.locationCode.toString(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          AppButton(
                            child: TextStyleGenerator(
                              text: AppStringConstants.edit,
                              style: AppTextStyles.body18Smooth,
                            ),
                            onTap: () {
                              viewModel.editProduct();
                            },
                          ),
                          8.h.verticalSpace,
                          AppButton(
                            child: TextStyleGenerator(
                              text: AppStringConstants.remove,
                              style: AppTextStyles.body18Smooth,
                            ),
                            onTap: () {
                              viewModel.removeProduct();
                            },
                            buttonColor: AppColors.red,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Container _productFirstLine(ProductViewModel viewModel) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: .5.sw,
            child: TextStyleGenerator(
              text: viewModel.product!.productName.toString(),
              style:
                  AppTextStyles.body14Bold.copyWith(color: AppColors.darkGrey),
            ),
          ),
          Container(
            width: .3.sw,
            padding: EdgeInsets.all(5.sp),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5.sp),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  color: Colors.grey.withOpacity(.05),
                  spreadRadius: 5,
                  blurRadius: .01,
                )
              ],
            ),
            child: Center(
              child: TextStyleGenerator(
                text:
                    "${AppStringConstants.itemCode} ${viewModel.product!.itemCode.toString()}",
                style: AppTextStyles.body12Smooth.copyWith(fontSize: 11.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildProductImageCard(ProductViewModel viewModel) {
    return Container(
      height: 150.h,
      margin: EdgeInsets.all(22.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.sp),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: Colors.grey.withOpacity(.05),
              spreadRadius: 5,
              blurRadius: .01,
            )
          ]),
      child: Center(
        child: Image.network(
          viewModel.product!.productImage,
          height: 100.h,
        ),
      ),
    );
  }
}

Widget _buildSubFiled(String title, String content) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 22.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyleGenerator(
          text: title,
          style: AppTextStyles.body14Bold.copyWith(color: AppColors.darkGrey),
        ),
        TextStyleGenerator(
          text: content.toUpperCase(),
          style: AppTextStyles.body16Bold.copyWith(color: AppColors.darkGrey),
        ),
      ],
    ),
  );
}
