import 'home_banners.dart';
import 'home_products.dart';
import 'package:flutter/material.dart';
import '../../manager/product_cubit.dart';
import '../../manager/product_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        return Column(
          spacing: 10.h,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeBanners(),
            HomeProducts(title: "عروض المساجد"),
            HomeProducts(title: "عروض الشركات"),
            HomeProducts(isVertical: true, title: s.popularProducts),
            SizedBox(height: 10.h),
          ],
        );
      },
    );
  }
}
