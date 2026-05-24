import 'custom_text.dart';
import '../di/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/auth/presentation/manager/auth_cubit.dart';

class CustomProfileWidget extends StatelessWidget {
  final double radius;
  const CustomProfileWidget({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    var user = getIt<AuthCubit>().user;
    String initial(String? s) =>
        (s != null && s.isNotEmpty) ? s.substring(0, 1).toUpperCase() : '';
    final first = initial(user?.firstName);
    final last = initial(user?.lastName);
    return CircleAvatar(
      radius: radius.r,
      backgroundColor: Theme.of(context).primaryColor,
      child: CustomText(text: first + last, size: 20.sp, type: Type.header),
    );
  }
}
