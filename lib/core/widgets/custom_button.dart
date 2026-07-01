import 'custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final String? text;
  final double? textSize;
  final IconData? icon;
  final Color? color;
  final Function() onPressed;
  final double? borderRadius;
  final bool enableBorderColor;

  const CustomButton({
    super.key,
    this.isLoading = false,
    this.width,
    this.height,
    this.textSize,
    this.text,
    this.icon,
    this.color,
    required this.onPressed,
    this.borderRadius,
    this.enableBorderColor = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.h,
                width: 40.h,
                child: CircularProgressIndicator(),
              ),
            ],
          )
        : _Body(
            width: width,
            height: height,
            padding: padding,
            text: text,
            textSize: textSize,
            icon: icon,
            color: color,
            onPressed: onPressed,
            borderRadius: borderRadius,
            enableBorderColor: enableBorderColor,
          );
  }
}

class _Body extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final double? textSize;
  final IconData? icon;
  final Color? color;
  final Function() onPressed;
  final double? borderRadius;
  final bool enableBorderColor;
  final EdgeInsetsGeometry? padding;
  const _Body({
    this.width,
    this.height,
    this.textSize,
    required this.text,
    this.icon,
    this.color,
    required this.onPressed,
    this.borderRadius,
    this.enableBorderColor = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return _TextOnly(
        width: width,
        height: height,
        text: text!,
        textSize: textSize,
        color: color,
        onPressed: onPressed,
        borderRadius: borderRadius,
        enableBorderColor: enableBorderColor,
        padding: padding,
      );
    } else {
      return _TextWithIcon(
        width: width,
        height: height,
        text: text!,
        textSize: textSize,
        icon: icon,
        color: color,
        onPressed: onPressed,
        borderRadius: borderRadius,
        enableBorderColor: enableBorderColor,
        padding: padding,
      );
    }
  }
}

class _TextOnly extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final double? textSize;
  final Color? color;
  final Function() onPressed;
  final double? borderRadius;
  final bool enableBorderColor;
  final EdgeInsetsGeometry? padding;
  const _TextOnly({
    this.width,
    this.height,
    this.textSize,
    required this.text,
    this.color,
    required this.onPressed,
    this.borderRadius,
    this.enableBorderColor = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 58.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding ?? EdgeInsets.zero,
          backgroundColor: enableBorderColor
              ? Colors.transparent
              : color ?? theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
            side: BorderSide(
              color: enableBorderColor
                  ? color ?? theme.primaryColor
                  : Colors.transparent,
              width: 1.0,
            ),
          ),
        ),
        child: CustomText(
          text: text,
          size: (textSize ?? 20).sp,
          type: Type.overMedium,
          color: enableBorderColor
              ? color ?? theme.primaryColor
              : theme.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}

class _TextWithIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final double? textSize;
  final IconData? icon;
  final Color? color;
  final Function() onPressed;
  final double? borderRadius;
  final bool enableBorderColor;
  final EdgeInsetsGeometry? padding;
  const _TextWithIcon({
    this.width,
    this.height,
    this.textSize,
    required this.text,
    this.icon,
    this.color,
    required this.onPressed,
    this.borderRadius,
    this.enableBorderColor = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 58.h,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon != null
            ? Icon(
                icon,
                size: 24.sp,
                color: enableBorderColor
                    ? color ?? theme.primaryColor
                    : theme.scaffoldBackgroundColor,
              )
            : const SizedBox.shrink(),
        label: CustomText(
          text: text,
          size: (textSize ?? 20).sp,
          type: Type.overMedium,
          color: enableBorderColor
              ? color ?? theme.primaryColor
              : theme.scaffoldBackgroundColor,
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding,
          backgroundColor: enableBorderColor
              ? Colors.transparent
              : color ?? theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
            side: BorderSide(
              color: enableBorderColor
                  ? color ?? theme.primaryColor
                  : Colors.transparent,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
