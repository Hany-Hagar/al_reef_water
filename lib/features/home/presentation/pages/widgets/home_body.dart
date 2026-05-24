import 'home_banners.dart';
import 'home_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeBanners(),
        SizedBox(height: 20.h),
        Expanded(
          child: HomeProducts()
        ),
      ],
    );
  }
}


