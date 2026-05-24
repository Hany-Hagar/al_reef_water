import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../auth/presentation/manager/auth_cubit.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var user = getIt<AuthCubit>().user;
    String getInitial(String? s) => (s != null && s.isNotEmpty) ? s.substring(0, 1) : '';
    final firstInitial = getInitial(user?.firstName);
    final lastInitial = getInitial(user?.lastName);
    var name = '$firstInitial $lastInitial'.trim();
    return CircleAvatar(
      radius: 50.r,
      backgroundColor: Theme.of(context).primaryColor,
      child: Text(
        name,
        style: TextStyle(fontSize: 40.sp, color: Colors.black),
      ),
    );
  }
}
