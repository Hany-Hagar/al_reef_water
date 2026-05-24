import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../cart/presentation/manager/cart_cubit.dart';
import '../../../../cart/presentation/manager/cart_states.dart';
import '../../../data/models/product_model.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBody extends StatelessWidget {
  final ProductModel product;
  const ProductBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.h,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: double.infinity),
        CustomText(text: "تفاصيل المنتج", size: 20.sp, type: Type.header),
        CustomText(text: product.title, size: 18.sp, maxLines: 10),
        CustomText(text: "السعر :", size: 20.sp, type: Type.header),
        CustomText(
          text: "${product.price} ر.س",
          size: 18.sp,
          color: Colors.green,
          type: Type.header,
        ),
        Spacer(),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) => CustomButton(
            isLoading: state is AddToCartLoading,
            onPressed: () => CartCubit.get(context).addToCart(product),
            text: "أضف إلى السلة",
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
