import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OverlappingImages extends StatelessWidget {
  final List<String> images;

  const OverlappingImages({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final visibleImages = images.length > 3 ? 3 : images.length;
    final moreCount = images.length - visibleImages;

    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: SizedBox(
        width: ((visibleImages + (moreCount > 0 ? 1 : 0)) * 12).w,
        height: 24.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ...List.generate(visibleImages, (index) {
              return PositionedDirectional(
                start: (index * 12).w,
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  padding: EdgeInsets.all(2.w),
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
              if (moreCount > 0)
              PositionedDirectional(
                start: (visibleImages * 12).w,
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration:  BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    text: '+$moreCount',
                    size: 10.sp,
                    type: Type.medium,
                  ),
                ),
              ),
          ],
        ),
      )
    );
  }
}