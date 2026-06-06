import 'settings_item.dart';
import 'app_preferences.dart';
import '../views/about_us_view.dart';
import '../views/contact_us_view.dart';
import 'package:flutter/material.dart';
import '../views/privacy_policy_view.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../auth/presentation/manager/auth_cubit.dart';
import '../../../../auth/presentation/manager/auth_states.dart';
import '../../../../orders/presentation/pages/views/orders_view.dart';
import '../../../../profile/presentation/pages/views/profile_view.dart';
import '../../../../locations/presentation/pages/views/locations_view.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.h),
        _Title(text: s.account),
        SettingsItem(
          title: s.profile,
          icon: IconBroken.User,
          nextScreen: ProfileView(),
        ),
        SettingsItem(
          title: s.manageLocations,
          icon: IconBroken.Location,
          nextScreen: LocationsView(),
        ),
        SettingsItem(
          title: s.ordersTitle,
          icon: IconBroken.Buy,
          nextScreen: OrdersView(),
        ),
        _Title(text: s.preferences),
        AppPreferences.lang(),
        AppPreferences.theme(),
        _Title(text: s.helpSupport),
        SettingsItem(
          title: s.privacyPolicy,
          icon: IconBroken.Shield_Done,
          nextScreen: PrivacyPolicyView(),
        ),
        SettingsItem(
          title: s.aboutUsTitle,
          icon: IconBroken.Info_Circle,
          nextScreen: AboutUsView(),
        ),
        SettingsItem(
          title: s.contactUsTitle,
          icon: IconBroken.Call,
          nextScreen: ContactUsView(),
        ),
        _Title(text: s.other),
        _Logout(),
        SizedBox(height: 20.h),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String text;
  const _Title({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: CustomText(text: text, size: 16.sp, type: Type.overMedium),
    );
  }
}

class _Logout extends StatelessWidget {
  const _Logout();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state is SignOutLoadingState
            ? ListTile(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: Colors.grey,
                title: CircularProgressIndicator(),
                titleAlignment: ListTileTitleAlignment.center,
              )
            : SettingsItem(
                onTap: getIt<AuthCubit>().signOut,
                title: S.of(context).logout,
                icon: IconBroken.Logout,
                nextScreen: const SizedBox(),
              );
      },
    );
  }
}
