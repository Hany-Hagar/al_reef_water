import 'package:flutter/material.dart';
import '../widgets/about_us_body.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_background.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(top: const _Top(), body: const AboutUsBody());
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: S.of(context).aboutUsTitle,
      backgroundColor: Colors.teal,
    );
  }
}
