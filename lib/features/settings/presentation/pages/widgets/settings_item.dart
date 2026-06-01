import 'package:flutter/material.dart';
import '../../../../../core/utils/nav_to.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/settings_cubit.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? nextScreen;
  final Function? onTap;
  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    this.nextScreen,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var isAr = SettingsCubit.get(context).state.lang == 'ar';
    return ListTile(
      onTap: () => _onTap(context),
      leading: Icon(icon, size: 24.sp),
      tileColor: Theme.of(context).scaffoldBackgroundColor,
      contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: CustomText(text: title, size: 18.sp, type: Type.overMedium),
      trailing:  Icon(isAr ? IconBroken.Arrow___Left_2 : IconBroken.Arrow___Right_2, size: 24.sp),
    );
  }

  void _onTap(BuildContext context) {
    if (onTap != null) {
      onTap!();
    } else if (nextScreen != null) {
      NavTo.push(context: context, nextPage: nextScreen ?? const SizedBox());
    }
  }
}
