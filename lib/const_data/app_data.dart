// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsetsDirectional defaultHomeAppBarPadding(BuildContext context) {
  return EdgeInsetsDirectional.only(
    top: MediaQuery.of(context).padding.top -3.h,
    start: 16.w,
    end: 16.w,
    bottom: 0.h,
  );
}

EdgeInsetsDirectional defaultAppBarPadding(BuildContext context) {
  return EdgeInsetsDirectional.only(
    top: MediaQuery.of(context).padding.top + 5.h,
    start: 16.w,
    end: 16.w,
    bottom: 12.h,
  );
}

var defautlBoxShadow = [
  BoxShadow(
    color: Colors.black.withAlpha((0.1 * 255).round()),
    blurRadius: 10,
    offset: const Offset(0, 5),
  ),
];
