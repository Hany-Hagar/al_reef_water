// ignore_for_file: deprecated_member_use, strict_top_level_inference

import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MTextFormField extends StatelessWidget {
  final double? width;
  final bool obscureText;
  final TextEditingController controller;
  final TextEditingController? passwordController;
  final TextInputType? keyboardType;
  final InputBorder? border;
  final Color? backgroundColor;
  final int maxLines;
  final int? maxLength;
  final EdgeInsets? padding;
  final IconData? prefixIcon;
  final Function()? prefixTap;
  final String? hintText;
  final String? labelText;
  final TextStyle? inputStyle;
  final TextStyle? hintStyle;
  final IconData? suffixIcon;
  final Function()? suffixTap;
  final bool readOnly;
  final bool autocorrect;
  final TextAlign? textAlign;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  const MTextFormField({
    super.key,
    this.width,
    this.obscureText = false,
    required this.controller,
    this.passwordController,
    this.keyboardType,
    this.border,
    this.backgroundColor,
    this.maxLines = 1,
    this.maxLength,
    this.padding,
    this.prefixIcon,
    this.prefixTap,
    this.hintText,
    this.labelText,
    this.inputStyle,
    this.hintStyle,
    this.suffixIcon,
    this.suffixTap,
    this.readOnly = false,
    this.autocorrect = true,
    this.textAlign,
    this.onTap,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.textInputAction,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      focusNode: focusNode,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        visualDensity: VisualDensity(vertical: -3),
        prefixIconConstraints: BoxConstraints(minWidth: 30.w, minHeight: 0),
        border: _setBorder(context: context),
        enabledBorder: _setBorder(context: context),
        focusedBorder: _setBorder(
          context: context,
          color: Theme.of(context).primaryColor,
        ),
        filled: true,
        fillColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        prefixIcon: _setPrefixIcon(),
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle ?? _FontStyle.hint(context),
        suffixIcon: _setSuffixIcon(),
        contentPadding: _setContentPadding(),
        errorStyle: Styles.textStyle500.copyWith(
          color: Colors.red,
          fontSize: 14.sp,
        ),
      ),
      style: inputStyle ?? _FontStyle.input(context),
      maxLines: maxLines,
      maxLength: maxLength,
      readOnly: readOnly,
      textAlign: textAlign ?? TextAlign.start,
      autocorrect: autocorrect,
      textInputAction: textInputAction,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: (value) =>
          validator?.call(value) ??
          _Validate.setValidator(
            keyboardType: keyboardType ?? TextInputType.text,
            value: value,
            confirmPasswordController: passwordController,
          ),
    );
  }

  InputBorder _setBorder({required BuildContext context, Color? color}) {
    return border?.copyWith(
          borderSide: BorderSide(
            width: 0.5,
            color: color ?? Theme.of(context).hintColor.withOpacity(0.5),
          ),
        ) ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 0.5,
            color: color ?? Theme.of(context).hintColor.withOpacity(0.5),
          ),
        );
  }

  EdgeInsets _setContentPadding() {
    return padding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h);
  }

  GestureDetector? _setPrefixIcon() {
    return prefixIcon != null
        ? GestureDetector(
            onTap: prefixTap,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w, end: 4.w),
              child: Icon(prefixIcon),
            ),
          )
        : null;
  }

  GestureDetector? _setSuffixIcon() {
    return suffixIcon != null
        ? GestureDetector(onTap: suffixTap, child: Icon(suffixIcon))
        : null;
  }
}

class _FontStyle {
  static TextStyle hint(BuildContext context) => Styles.textStyle500.copyWith(
    color: Theme.of(context).hintColor.withOpacity(0.7),
    fontSize: 18.sp,
    height: 2.5,
  );
  static TextStyle input(BuildContext context) => Styles.textStyle500.copyWith(
    color: Theme.of(context).hintColor,
    fontSize: 20.sp,
  );
}

class _Validate {
  final errorMessage = "";
  static String? setValidator({
    required TextInputType keyboardType,
    required String? value,
    TextEditingController? confirmPasswordController,
  }) {
    if (keyboardType == TextInputType.emailAddress) {
      return _emailValidator(value);
    } else if (keyboardType == TextInputType.visiblePassword) {
      if (confirmPasswordController != null) {
        return _conformPasswordValidator(value, confirmPasswordController);
      } else {
        return _passwordValidator(value);
      }
    } else if (keyboardType == TextInputType.phone) {
      return _phoneNumberValidator(value);
    } else if (keyboardType == TextInputType.streetAddress) {
      return _streetAddressValidator(value);
    } else if (keyboardType == TextInputType.url) {
      return _urlValidator(value);
    } else if (keyboardType == TextInputType.number) {
      return _numberValidator(value);
    } else {
      return _textValidator(value);
    }
  }

  static String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    // Regular expression for basic email validation
    final emailRegex = RegExp(
      r'^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$',
      caseSensitive: false,
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? _textValidator(value) {
    if (value.isEmpty) {
      return 'This field cannot be left empty';
    } else {
      return null;
    }
  }

  static String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    final uppercaseRegex = RegExp(r'[A-Z]');
    final lowercaseRegex = RegExp(r'[a-z]');
    final digitRegex = RegExp(r'\d');
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (!uppercaseRegex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!lowercaseRegex.hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!digitRegex.hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!specialCharRegex.hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static String? _conformPasswordValidator(
    String? value,
    TextEditingController confirmPasswordController,
  ) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    if (value != confirmPasswordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? _phoneNumberValidator(
    String? value, {
    bool isPhoneNumber = false,
  }) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    if (isPhoneNumber) {
      // Regular expression for phone number validation
      final phoneRegex = RegExp(
        r'^\+?[1-9]\d{1,14}$', // Basic regex for international phone numbers
        caseSensitive: false,
      );

      if (!phoneRegex.hasMatch(value)) {
        return 'Please enter a valid phone number';
      }
    }

    return null;
  }

  static String? _streetAddressValidator(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    // Regular expression to validate address format
    final addressRegex = RegExp(r'^[\d\w\s,.-]+$');
    if (!addressRegex.hasMatch(value)) {
      return 'Please enter a valid address';
    }

    // Optionally, check the length of the address
    if (value.length < 5 || value.length > 100) {
      return 'Address should be between 5 and 100 characters';
    }

    return null;
  }

  static String? _urlValidator(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    // Regular expression to validate URL format
    final urlRegex = RegExp(
      r"^(https?:\/\/)?([\w-]+\.)+[\w-]+(\/[\w-]*)*(\?[^\s]*)?$",
      caseSensitive: false,
    );

    if (!urlRegex.hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }

  static String? _numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    final numberRegex = RegExp(r'^[0-9]+$');
    if (!numberRegex.hasMatch(value)) {
      return 'Please enter only numbers';
    }

    final number = int.tryParse(value);
    if (number == null || number == 0) {
      return 'Enter Vaild Value';
    }

    return null;
  }
}
