import 'package:flutter/material.dart';
import '../../const_data/app_data.dart';
import '../../../core/utils/nav_to.dart';
import '../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/settings/presentation/manager/settings_cubit.dart';
import '../services/icon_broken.dart';

class CustomAppBar extends StatelessWidget {
  final IconData? leading;
  final Widget? leadingWidget;
  final Color? iconColor;
  final String title;
  final Widget? bottom;
  final Color? backgroundColor;
  final Widget? action;
  final bool centerTitle;
  const CustomAppBar({
    super.key,
    this.leading,
    this.leadingWidget,
    this.iconColor,
    required this.title,
    this.bottom,
    this.backgroundColor,
    this.action,
    this.centerTitle = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultAppBarPadding(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        borderRadius: bottom != null
            ? BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              )
            : null,
      ),
      child: Column(
        spacing: 10.h,
        children: [
          Row(
            children: [
              ?leadingWidget,
              if (leadingWidget == null)
                _Start(iconColor: iconColor, leading: leading),
              if (centerTitle) Spacer(),
              if (!centerTitle) SizedBox(width: 16.w),
              _Title(text: title),
              Spacer(),
              ?action,
            ],
          ),
          ?bottom,
        ],
      ),
    );
  }
}

class _Start extends StatelessWidget {
  final Color? iconColor;
  final IconData? leading;

  const _Start({required this.iconColor, required this.leading});

  @override
  Widget build(BuildContext context) {
    bool isArabic = SettingsCubit.get(context).state.lang == 'ar';
    return GestureDetector(
      onTap: () => NavTo.pop(context),
      child: Icon(
        leading ??
            (isArabic ? IconBroken.Arrow___Right : IconBroken.Arrow___Left),
        size: 25.sp,
        color: iconColor ?? Theme.of(context).hintColor,
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;
  const _Title({required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      size: 25.sp,
      type: Type.overMedium,
      color: Theme.of(context).hintColor,
    );
  }
}
