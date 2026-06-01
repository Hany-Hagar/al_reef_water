import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../const_data/asset_data.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../data/models/location_model.dart';
import '../../manager/location_cubit.dart';
import '../../manager/location_states.dart';
import '../../../../../core/widgets/custom_list.dart';

class LocationsBody extends StatelessWidget {
  const LocationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        var cubit = LocationCubit.get(context);
        return CustomList(
          isLoading: state is LocationLoading,
          isFailure: state is LocationError,
          errorMessage: (state is LocationError) ? state.message : null,
          items: cubit.locations,
          emptyItems: List.generate(5, (index) => LocationModel.empty()),
          itemBuilder: (context, location) {
            final theme = Theme.of(context);
            return Container(
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: theme.dividerColor.withAlpha(40)),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16.r),
                  onTap: () {
                    // Handle location selection
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14.r),
                          child: Image.asset(
                            AssetData.logo,
                            width: 72.w,
                            height: 72.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: location.title,
                                size: 16.sp,
                                type: Type.overMedium,
                                color: theme.textTheme.titleMedium?.color,
                                maxLines: 1,
                              ),
                              SizedBox(height: 6.h),
                              CustomText(
                                text: location.fullAddress,
                                size: 13.sp,
                                type: Type.overSmall,
                                color: theme.hintColor,
                                maxLines: 2,
                              ),
                              SizedBox(height: 10.h),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: CustomButton(
                                  onPressed: () {
                                    // Handle location editing
                                  },
                                  text: 'تعديل',
                                  textSize: 13,
                                  width: 88.w,
                                  height: 34.h,
                                  borderRadius: 10.r,
                                  enableBorderColor: true,
                                  color: theme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
