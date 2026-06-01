import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../auth/presentation/manager/auth_cubit.dart';
import '../../../../auth/presentation/manager/auth_states.dart';

class SettingsTopBackground extends StatelessWidget {
  const SettingsTopBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BackGround(),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              CustomText(
                text: S.of(context).settings,
                size: 24.sp,
                type: Type.header,
                color: Colors.white,
              ),
              SizedBox(height: 20.h),
              _Profile(),
            ],
          ),
        ),
      ],
    );
  }
}

class _BackGround extends StatelessWidget {
  const _BackGround();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF19C5A3), Color(0xFF3DDC97)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Positioned(
          top: -80,
          right: -80,
          child: Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),
        ),

        // دائرة ثانية
        Positioned(
          bottom: -120,
          left: -100,
          child: Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.06),
            ),
          ),
        ),
      ],
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      var user = AuthCubit.get(context).user;
      var name = "${user?.firstName ?? ''} ${user?.lastName ?? ''}".trim();
      var email = user?.email ?? '';
      return Row(
      children: [
        CircleAvatar(
          radius: 32.r,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(IconBroken.Profile, color: Colors.white, size: 24),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: name.isNotEmpty ? name : '',
                size: 22.sp,
                color: Colors.white,
                type: Type.overMedium,
              ),
              CustomText(
                text: email,
                size: 15.sp,
                color: Colors.white,
                type: Type.overMedium,
              ),
            ],
          ),
        ),
      ],
    );
    });
    
  }
}
