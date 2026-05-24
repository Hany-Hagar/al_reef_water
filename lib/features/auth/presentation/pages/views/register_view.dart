import 'package:flutter/material.dart';
import '../widgets/register_body.dart';
import '../../../../../core/widgets/custom_background.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: RegisterBody()
    );
  }
}