import 'custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/auth/presentation/manager/auth_cubit.dart';
import '../../features/auth/presentation/manager/auth_states.dart';

class ProfileWidget extends StatelessWidget {
  final double radius;
  const ProfileWidget({super.key, this.radius = 25.0});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var user = AuthCubit.get(context).user;
        String getInitial(String? s) =>
            (s != null && s.isNotEmpty) ? s.substring(0, 1) : '';
        final firstInitial = getInitial(user?.firstName);
        final lastInitial = getInitial(user?.lastName);
        var name = '$firstInitial$lastInitial'.trim();
        return CircleAvatar(
          radius: radius.r,
          backgroundColor: Theme.of(context).primaryColor,
          child: CustomText(text: name, size: (radius-3).sp, type: Type.header),
        );
      },
    );
  }
}
