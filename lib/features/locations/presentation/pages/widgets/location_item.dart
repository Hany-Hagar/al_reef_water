import 'package:al_reef_app/core/widgets/custom_delete_icon.dart';
import 'package:al_reef_app/features/locations/presentation/manager/location_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import '../../../data/models/location_model.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/location_cubit.dart';
import '../views/add_edit_location_view.dart';

class LocationItem extends StatelessWidget {
  final LocationModel location;
  const LocationItem({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        LocationCubit.get(context).setControllers(location);
        NavTo.push(
          context: context,
          nextPage: AddEditLocationView(isEdit: true),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.06),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.h,
          children: [
            _Title(location: location),
            _Body(location: location),
            _Bottom(location: location),
          ],
        ),
      ),
    );
  }
}

class _ItemField extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isHeader;

  const _ItemField({
    required this.icon,
    required this.label,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10.w,
      children: [
        Container(
          padding: isHeader ? EdgeInsets.all(6.r) : EdgeInsets.zero,
          decoration: isHeader
              ? BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                )
              : null,
          child: Icon(
            icon,
            size: isHeader ? 18.sp : 16.sp,
            color: isHeader
                ? Theme.of(context).primaryColor
                : Theme.of(context).hintColor.withValues(alpha: 0.8),
          ),
        ),
        Flexible(
          child: CustomText(
            text: label,
            size: isHeader ? 15.sp : 13.sp,
            type: isHeader ? Type.header : Type.overMedium,
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final LocationModel location;
  const _Title({required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 14.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _ItemField(
              icon: IconBroken.Info_Circle,
              label: location.name,
              isHeader: true,
            ),
              Spacer(),
            BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                var cubit = LocationCubit.get(context);
                return CustomDeleteIcon(
                  isLoading:
                      state is DeleteLocationLoading &&
                      cubit.deleteId == location.id,
                  onTap: () => cubit.deleteLocation(location.id),
                );
              },
            ),
          ],
        ),
        Divider(
          height: 1.h,
          thickness: 1.h,
          color: Theme.of(context).dividerColor.withValues(alpha: 0.08),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final LocationModel location;
  const _Body({required this.location});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 12.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ItemField(icon: IconBroken.Category, label: location.region),
        Row(
          children: [
            Expanded(
              child: _ItemField(
                icon: IconBroken.Discovery,
                label: location.city,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _ItemField(
                icon: IconBroken.Activity,
                label: location.district,
              ),
            ),
          ],
        ),
        _ItemField(
          icon: IconBroken.Filter,
          label: '${s.street}${location.street}',
        ),
      ],
    );
  }
}

class _Bottom extends StatelessWidget {
  final LocationModel location;
  const _Bottom({required this.location});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.04),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ItemField(
              icon: IconBroken.Document,
              label: '${s.building}${location.buildingNumber}',
            ),
          ),
          Container(
            height: 16.h,
            width: 1.w,
            color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: _ItemField(
              icon: IconBroken.Home,
              label: '${s.floor}${location.floor}',
            ),
          ),
        ],
      ),
    );
  }
}
