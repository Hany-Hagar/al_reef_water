import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ProfileItem extends StatelessWidget {
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
  final TextInputAction? textInputAction;
  final Function(String?)? onChanged;

  const ProfileItem({
    super.key,
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
    required this.textInputAction,
    this.onChanged,
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
          textInputAction: textInputAction,
          onChanged: onChanged,
          
        ),
      ],
    );
  }
}
