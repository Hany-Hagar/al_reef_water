import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../const_data/app_data.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyBody extends StatelessWidget {
  const PrivacyPolicyBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 10.h,
      children: [
        CustomCard(
          emoji: "🔒",
          title: s.privacyPolicy,
          description: s.privacyPolicyDescription,
        ),

        CustomCard(
          emoji: "🔒",
          title: s.firstPolicy,
          description: s.firstPolicyDescription,
        ),

        CustomCard(
          emoji: "🔒",
          title: s.secondPolicy,
          description: s.secondPolicyDescription,
        ),

        CustomCard(
          emoji: "🔒",
          title: s.thirdPolicy,
          description: s.thirdPolicyDescription,
        ),

        CustomCard(
          emoji: "🔒",
          title: s.fourthPolicy,
          description: s.fourthPolicyDescription,
        ),

        CustomCard(
          emoji: "🔒",
          title: s.fivthPolicy,
          description: s.fivthPolicyDescription,
        ),

        CustomCard(
          emoji: "🔒",
          title: s.sexthPolicy,
          description: s.sexthPolicyDescription,
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String emoji;
  final String description;
  const CustomCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        boxShadow: defautlBoxShadow,
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).scaffoldBackgroundColor,

      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(text: emoji, size: 18.sp, type: Type.header),
              SizedBox(width: 10.w),
              Expanded(
                child: CustomText(text: title, size: 18.sp, type: Type.header , maxLines: 3,)
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: description,
             size: 16.sp, 
             type: Type.overMedium,
             maxLines: 10,
             ),
        ],
      ),
    );
  }
}
