// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsBody extends StatelessWidget {
  const ContactUsBody({super.key});

  Future<void> _launchUrl(BuildContext context, Uri uri) async {
    try {
      if (!await launchUrl(uri)) {
        throw 'Could not launch $uri';
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Cannot open: ${uri.toString()}')));
    }
  }

  void _copyAndNotify(BuildContext context, String label, String value) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$label copied')));
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = screenWidth * 0.055;
    final bodySize = screenWidth * 0.042;

    const email = 'alreefater@gmail.com';
    const phone = '+966 56 689 9556';

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomText(
              text: s.contactUsTitle,
              size: titleSize,
              type: Type.header,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: s.contactUsDescription,
            size: bodySize,
            height: 1.6,
            maxLines: 20,
          ),
          SizedBox(height: 18.h),

          ContactTile(
            icon: Icons.email,
            iconColor: Colors.deepPurple,
            title: s.emailAddress,
            value: email,
            onCopy: () => _copyAndNotify(context, s.emailAddress, email),
            onAction: () =>
                _launchUrl(context, Uri(scheme: 'mailto', path: email)),
          ),

          SizedBox(height: 12.h),

          ContactTile(
            icon: Icons.phone,
            iconColor: Colors.teal,
            title: s.phoneNumber,
            value: phone,
            onCopy: () => _copyAndNotify(context, s.phoneNumber, phone),
            onAction: () =>
                _launchUrl(context, Uri(scheme: 'https', host: 'wa.me', path: phone)),
          ),
        ],
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final VoidCallback onCopy;
  final VoidCallback onAction;

  const ContactTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.onCopy,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final titleSize = width * 0.04;
    final valueSize = width * 0.038;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onAction,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [iconColor.withValues(alpha: 0.12), Colors.transparent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: iconColor.withValues(alpha: 0.18)),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 22.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: title,
                      size: titleSize,
                      type: Type.overSmall,
                    ),
                    SizedBox(height: 6.h),
                    CustomText(text: value, size: valueSize, maxLines: 2),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              IconButton(
                onPressed: onCopy,
                icon: Icon(
                  Icons.copy,
                  size: 18.sp,
                  color: Theme.of(context).hintColor,
                ),
                tooltip: 'Copy',
              ),
              IconButton(
                onPressed: onAction,
                icon: Icon(Icons.open_in_new, size: 18.sp, color: iconColor),
                tooltip: 'Open',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
