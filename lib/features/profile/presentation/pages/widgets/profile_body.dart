// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'profile_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 10.h,
      children: [
        ProfileWidget(),
        SizedBox(height: 20.h),
        const _Name(),
        _Item(
          title: s.phoneNumber,
          prefixIcon: Icons.phone,
          hint: s.phoneNumberHint,
          keyboardType: TextInputType.phone,
          controller: TextEditingController(),
        ),
        _Item(
          readOnly: true,
          title: s.emailAddress,
          prefixIcon: Icons.email,
          hint: s.emailAddressHint,
          controller: TextEditingController(),
          keyboardType: TextInputType.emailAddress,
        ),
        _Item(
          title: s.password,
          obscureText: true,
          hint: s.passwordHint,
          prefixIcon: Icons.lock,
          controller: TextEditingController(),
          keyboardType: TextInputType.visiblePassword,
        ),
        _Item(
          obscureText: true,
          prefixIcon: Icons.lock,
          title: s.confirmPassword,
          hint: s.confirmPasswordHint,
          controller: TextEditingController(),
          keyboardType: TextInputType.visiblePassword,
        ),
        SizedBox(height: 15.h),
        _Actions(),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController? passwordController;
  final Function()? onSuffixPressed;
  final bool readOnly;
  const _Item({
    required this.title,
    required this.hint,
    required this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSuffixPressed,
    this.obscureText = false,
    this.passwordController,
    required this.keyboardType,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, size: 16.sp, type: Type.overMedium),
        MTextFormField(
          hintText: hint,
          controller: controller,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          obscureText: obscureText,
          suffixTap: onSuffixPressed,
          keyboardType: keyboardType,
          passwordController: passwordController,
          readOnly: readOnly,
        ),
      ],
    );
  }
}

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Row(
      children: [
        Expanded(
          child: _Item(
            title: s.firstName,
            hint: s.firstNameHint,
            prefixIcon: Icons.person,
            keyboardType: TextInputType.name,
            controller: TextEditingController(),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: _Item(
            title: s.lastName,
            hint: s.lastNameHint,
            prefixIcon: Icons.person,
            keyboardType: TextInputType.name,
            controller: TextEditingController(),
          ),
        ),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: CustomButton(
            text: S.of(context).save,
            onPressed: () {},
            width: double.infinity,
          ),
        ),

        SizedBox(width: 10.w),
        Expanded(
          flex: 3,
          child: CustomButton(
            text: s.deleteAccount,
            onPressed: () {},
            textSize: 18.sp,
            color: Colors.red,
            width: double.infinity,
            enableBorderColor: true,
          ),
        ),
      ],
    );
  }
}
