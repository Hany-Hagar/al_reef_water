import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: s.aboutUsTitle,
              size: 20.sp,
              type: Type.header,
              maxLines: 2,
            ),
          SizedBox(height: 16.h),
          CustomText(text: s.aboutUsDescription, size: 16.sp, height: 1.6, maxLines: 20),
          SizedBox(height: 12.h),
          CustomText(
            text: s.visionTitle,
            size: 20.sp,
            type: Type.overMedium,
            maxLines: 2,
          ),
          SizedBox(height: 8.h),
          CustomText(text: s.visionDescription, size: 16.sp, height: 1.6, maxLines: 20),
        ],
      ),
    );
  }
}
