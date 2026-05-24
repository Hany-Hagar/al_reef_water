import '../widgets/profile_body.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      top: const _Top(),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16.w), child: ProfileBody()),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "",
      backgroundColor: Colors.transparent,
    );
  }
}
