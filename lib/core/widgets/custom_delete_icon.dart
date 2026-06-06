import '../services/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomDeleteIcon extends StatelessWidget {
  final bool isLoading;
  final Function()? onTap;
  final int size;
  const CustomDeleteIcon({
    super.key, 
    required this.isLoading, 
    this.onTap,
    this.size = 24,
    });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(
            width: size.w,
            height: size.h,
            child: CircularProgressIndicator(),
          )
        : GestureDetector(
            onTap: onTap,
            child: Icon(IconBroken.Delete, size: size.sp, color: Colors.red),
          );
  }
}
