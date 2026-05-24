import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_background.dart';
import '../widgets/contact_us_body.dart';
import '../../../../../generated/l10n.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      top: const _Top(),
      body: const ContactUsBody(),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: S.of(context).contactUsTitle,
      backgroundColor: Colors.teal,
    );
  }
}