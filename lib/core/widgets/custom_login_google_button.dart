import 'custom_text.dart';
import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../const_data/asset_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoginGoogleButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onGooglePressed;
  const CustomLoginGoogleButton({
    required this.isLoading,
    required this.onGooglePressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const _Loading()
        : _Body(onGooglePressed: onGooglePressed);
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).dividerColor.withAlpha(50),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Center(
          child: SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final VoidCallback? onGooglePressed;
  const _Body({required this.onGooglePressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ListTile(
        onTap: onGooglePressed,
        tileColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Image.asset(AssetData.googleLogo, width: 24),
        title: CustomText(
          text: S.of(context).signWithGoogle,
          size: 17.sp,
          type: Type.header,
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Theme.of(context).dividerColor.withAlpha(50)),
        ),
      ),
    );
  }
}
