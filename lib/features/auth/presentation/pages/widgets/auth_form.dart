import '../views/register_view.dart';
import 'package:flutter/material.dart';
import '../views/forget_password_view.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_login_google_button.dart';

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool isRegister;
  final bool isLoading;
  final bool googleLoading;
  final Function() onPressed;
  final Function()? onGooglePressed;

  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? phoneNumberController;
  final TextEditingController emailController;

  final bool obscurePassword;
  final Function()? onPasswordSuffixPressed;
  final TextEditingController passwordController;

  final bool obscureConfirmPassword;
  final Function()? onConfirmPasswordSuffixPressed;
  final TextEditingController? confirmPasswordController;

  const AuthForm({
    super.key,
    required this.formKey,
    required this.isRegister,
    required this.isLoading,
    required this.onPressed,

    this.firstNameController,
    this.lastNameController,
    this.phoneNumberController,
    required this.emailController,
    required this.obscurePassword,
    this.onPasswordSuffixPressed,
    required this.passwordController,
    required this.obscureConfirmPassword,
    this.onConfirmPasswordSuffixPressed,
    this.confirmPasswordController,
    required this.googleLoading,
    required this.onGooglePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            spacing: 10.h,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              if (!isRegister)
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              _Top(isLogin: !isRegister),
              SizedBox(height: 10.h),
              if (isRegister) _FirstName(controller: firstNameController!),
              if (isRegister) _LastName(controller: lastNameController!),
              if (isRegister) _PhoneNumber(controller: phoneNumberController!),
              _Email(controller: emailController),
              _Password(
                controller: passwordController,
                obscureText: obscurePassword,
                onSuffixPressed: onPasswordSuffixPressed,
              ),
              if (!isRegister) _ForgetPassword(),
              if (isRegister)
                _ConfirmPassword(
                  controller: confirmPasswordController!,
                  passwordController: passwordController,
                  obscureText: obscureConfirmPassword,
                  onSuffixPressed: onConfirmPasswordSuffixPressed,
                ),
              _Button(
                isLogin: !isRegister,
                isLoading: isLoading,
                onPressed: onPressed,
              ),
              _OrLogWith(),
              CustomLoginGoogleButton(
                isLoading: googleLoading,
                onGooglePressed: onGooglePressed,
              ),
              if (isRegister) _AlReady(),
              if (!isRegister) _DontHave(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  final bool isLogin;
  const _Top({required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: isLogin
              ? S.of(context).loginTitle
              : S.of(context).registerTitle,
          size: 22.sp,
          type: Type.header,
        ),
        CustomText(
          text: isLogin
              ? S.of(context).loginSubtitle
              : S.of(context).registerSubtitle,
          size: 16.sp,
          type: Type.medium,
          opacity: FontOpacity.medium,
        ),
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
        ),
      ],
    );
  }
}

class _FirstName extends StatelessWidget {
  final TextEditingController controller;
  const _FirstName({required this.controller});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      title: s.firstName,
      hint: s.firstNameHint,
      controller: controller,
      prefixIcon: IconBroken.User,
      keyboardType: TextInputType.name,
    );
  }
}

class _LastName extends StatelessWidget {
  final TextEditingController controller;
  const _LastName({required this.controller});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      title: s.lastName,
      hint: s.lastNameHint,
      controller: controller,
      prefixIcon: IconBroken.User,
      keyboardType: TextInputType.name,
    );
  }
}

class _PhoneNumber extends StatelessWidget {
  final TextEditingController controller;
  const _PhoneNumber({required this.controller});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      title: s.phoneNumber,
      hint: s.phoneNumberHint,
      controller: controller,
      prefixIcon: IconBroken.Call,
      keyboardType: TextInputType.phone,
    );
  }
}

class _Email extends StatelessWidget {
  final TextEditingController controller;
  const _Email({required this.controller});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      title: s.emailAddress,
      hint: s.emailAddressHint,
      controller: controller,
      prefixIcon: IconBroken.Message,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _Password extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? passwordController;
  final bool obscureText;
  final Function()? onSuffixPressed;
  const _Password({
    required this.controller,
    // ignore: unused_element_parameter
    this.passwordController,
    this.obscureText = false,
    this.onSuffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      title: s.password,
      hint: s.passwordHint,
      controller: controller,
      prefixIcon: IconBroken.Lock,
      suffixIcon: obscureText ? IconBroken.Show : IconBroken.Hide,
      onSuffixPressed: onSuffixPressed,
      obscureText: obscureText,
      passwordController: passwordController,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}

class _ForgetPassword extends StatelessWidget {
  const _ForgetPassword();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavTo.push(context: context, nextPage: ForgetPasswordView()),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: CustomText(
            text: S.of(context).didyouForgetPassword,
            size: 14.sp,
            type: Type.overMedium,
            color: Styles.linkColor,
          ),
        ),
      ),
    );
  }
}

class _ConfirmPassword extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? passwordController;
  final bool obscureText;
  final Function()? onSuffixPressed;
  const _ConfirmPassword({
    required this.controller,
    this.passwordController,
    this.obscureText = false,
    this.onSuffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      title: s.confirmPassword,
      hint: s.confirmPasswordHint,
      controller: controller,
      prefixIcon: IconBroken.Lock,
      suffixIcon: obscureText ? IconBroken.Show : IconBroken.Hide,
      onSuffixPressed: onSuffixPressed,
      obscureText: obscureText,
      passwordController: passwordController,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}

class _Button extends StatelessWidget {
  final bool isLogin;
  final bool isLoading;
  final Function() onPressed;
  const _Button({
    required this.isLogin,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, top: isLogin ? 0 : 10.h),
      child: CustomButton(
        isLoading: isLoading,
        onPressed: onPressed,
        text: isLogin
            ? S.of(context).loginButton
            : S.of(context).registerButton,
      ),
    );
  }
}

class _OrLogWith extends StatelessWidget {
  const _OrLogWith();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Row(
      children: [
        Expanded(
          child: Divider(color: Colors.grey, thickness: 1, endIndent: 10.w),
        ),
        CustomText(size: 14.sp, type: Type.medium, text: s.orLoginWith),
        Expanded(
          child: Divider(color: Colors.grey, thickness: 1, indent: 10.w),
        ),
      ],
    );
  }
}

class _DontHave extends StatelessWidget {
  const _DontHave();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: S.of(context).dontHaveAnAccount,
          size: 14.sp,
          type: Type.overMedium,
          opacity: FontOpacity.medium,
        ),
        SizedBox(width: 6.w),
        GestureDetector(
          onTap: () => NavTo.push(context: context, nextPage: RegisterView()),
          child: CustomText(
            text: S.of(context).registerNow,
            size: 14.sp,
            type: Type.overMedium,
            color: Styles.linkColor,
          ),
        ),
      ],
    );
  }
}

class _AlReady extends StatelessWidget {
  const _AlReady();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: S.of(context).alreadyHaveAnAccount,
            size: 15.sp,
            type: Type.overMedium,
            opacity: FontOpacity.medium,
          ),
          SizedBox(width: 5.w),
          GestureDetector(
            onTap: () => NavTo.pop(context),
            child: CustomText(
              text: S.of(context).loginNow,
              size: 14.sp,
              type: Type.overMedium,
              color: Styles.linkColor,
            ),
          ),
        ],
      ),
    );
  }
}
