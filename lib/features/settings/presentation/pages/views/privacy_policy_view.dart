import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/privacy_policy_Body.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(top: const _Top(), body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: const PrivacyPolicyBody()
      )
    ));
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(title: S.of(context).privacyPolicy, backgroundColor: Colors.teal);
  }
}
