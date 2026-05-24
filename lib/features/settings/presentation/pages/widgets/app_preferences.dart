// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import '../../manager/settings_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/app_user_pref.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


abstract class AppPreferences{
  static Widget lang() => const _Lang();
  static Widget theme() => const _Theme();
}

class _Lang extends StatelessWidget {
  const _Lang();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = SettingsCubit.get(context);
    return BlocBuilder<SettingsCubit,AppUserPref>(
      builder: (context, state) => _Item(
        title: s.Language,
        values: ['en', 'ar'],
        items: [s.English, s.Arabic],
        icon: Icons.language_outlined,
        selectedValue: state.lang,
        onTap: (value) => cubit.updateLanguage(value),
      )
    );
  }
}

class _Theme extends StatelessWidget {
  const _Theme();

  @override
  Widget build(BuildContext context) {
    var cubit = SettingsCubit.get(context);
    var s = S.of(context);
    return BlocBuilder<SettingsCubit,AppUserPref>(
      builder: (context, state) => _Item(
        icon: Icons.brightness_4_outlined,
        title: s.Theme,
        items: [s.Light, s.Dark, s.System],
        selectedValue: state.theme,
        onTap: (value) => cubit.updateTheme(value),
        values: [ThemeMode.light, ThemeMode.dark, ThemeMode.system],
      )
    );
  }
}

class _Item extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> items;
  final List<dynamic> values;
  final dynamic selectedValue;
  final Function(dynamic value) onTap;
  const _Item({
    required this.icon,
    required this.title,
    required this.items,
    required this.values,
    required this.selectedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).scaffoldBackgroundColor;
    return ExpansionTile(
      shape: _shape,
      collapsedShape: _shape,
      backgroundColor: color,
      collapsedBackgroundColor: color,
      leading: Icon(icon),
      childrenPadding: EdgeInsets.only(bottom: 10.h),
      title: CustomText(text: title, size: 18.sp, type: Type.overMedium),
      children: [
        _Sub(
          titles: items,
          values: values,
          selectedValue: selectedValue,
          onTap: onTap,
        ),
      ],
    );
  }

  ShapeBorder get _shape => RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.r),
    side: BorderSide.none,
  );
}

class _Sub extends StatelessWidget {
  final List<String> titles;
  final List<dynamic> values;
  final dynamic selectedValue;
  final Function(dynamic value) onTap;
  const _Sub({
    required this.titles,
    required this.values,
    required this.selectedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: List.generate(
          titles.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () => onTap(values[index]),
              child: _SubItem(
                title: titles[index],
                isSelected: selectedValue == values[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SubItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  const _SubItem({required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: CustomText(text: title, size: 16.sp, type: Type.medium),
    );
  }
}
