import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../home/data/models/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final int count;
  final ProductModel product;
  const CartItem({super.key, required this.count, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: SizedBox(
        height: 120.h,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: _ItemImage(imageUrl: product.images.first),
            ),
            Expanded(flex: 3, child: _ItemBody(count: count, product: product)),
          ],
        ),
      ),
    );
  }
}

class _ItemImage extends StatelessWidget {
  final String imageUrl;

  const _ItemImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _ItemBody extends StatelessWidget {
  final int count;
  final ProductModel product;

  const _ItemBody({required this.count, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomText(
              text: product.title,
              size: 14.sp,
              maxLines: 3,
              type: Type.overMedium,
            ),
          ),

          CustomText(
            text: "${product.price.toStringAsFixed(2)} ر.س",
            size: 13.sp,
            type: Type.overMedium,
          ),

          SizedBox(height: 10.h),

          Row(
            spacing: 10.w,
            children: [
              CustomText(text: "الكمية: " , size: 13.sp, type: Type.overMedium),
              _ItemCount(count: count, onAdd: () {}, onRemove: () {}),
            ]
          ),
        ],
      ),
    );
  }
}

class _ItemCount extends StatelessWidget {
  final int count;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const _ItemCount({
    required this.count,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CountButton(icon: Icons.remove, onTap: onRemove),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomText(text: "$count", size: 14.sp, type: Type.overMedium),
        ),

        _CountButton(icon: Icons.add, onTap: onAdd),
      ],
    );
  }
}

class _CountButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CountButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.r),
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: Theme.of(context).primaryColor,
        ),
        child: Icon(icon, size: 18.sp),
      ),
    );
  }
}
