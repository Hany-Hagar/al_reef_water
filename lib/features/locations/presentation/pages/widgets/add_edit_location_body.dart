// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/location_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/location_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:al_reef_app/core/utils/styles.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_drop_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AddEditLocationBody extends StatelessWidget {
  final bool isEdit;
  final GlobalKey<FormState> formKey;
  const AddEditLocationBody({
    super.key,
    required this.isEdit,
    required this.formKey,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            spacing: 10.h,
            children: [
              SizedBox(height: 3.h),
              _Name(),
              _Country(),
              _Regions(),
              _City(),
              _District(),
              _Street(),
              _BuildingNumber(),
              _Floor(),
              SizedBox(height: 12.h),
              BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  if (isEdit) {
                    return _Edit(
                      isLoading: state is UpdateLocationLoading,
                      formKey: formKey,
                    );
                  } else {
                    return _Add(
                      isLoading: state is AddLocationLoading,
                      formKey: formKey,
                    );
                  }
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final bool readOnly;
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const _Item({
    required this.title,
    required this.icon,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, type: Type.overMedium, size: 18.sp),
        MTextFormField(
          readOnly: readOnly,
          hintText: hintText,
          prefixIcon: icon,
          controller: controller,
          keyboardType: keyboardType,
          inputStyle: Styles.textStyle400.copyWith(
            fontSize: 17.sp,
            color: Theme.of(context).hintColor,
          ),
          hintStyle: Styles.textStyle400.copyWith(
            height: 3,
            fontSize: 13.sp,
            color: Theme.of(context).hintColor,
          ),
        ),
      ],
    );
  }
}

class _DropDownItem extends StatelessWidget {
  final String title;
  final String hintText;
  final List<dynamic> items;
  final dynamic initialItem;
  final void Function(dynamic)? onChanged;
  const _DropDownItem({
    required this.title,
    required this.hintText,
    required this.items,
    this.initialItem,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Column(
      spacing: 10.h,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, type: Type.overMedium, size: 18.sp),
        CustomDropMenu(
          hintText: hintText,
          items: items,
          value: initialItem,
          onChanged: onChanged,
          itemLabel: (item) => item.names[isArabic ? 1 : 0],
        ),
      ],
    );
  }
}

class _Country extends StatelessWidget {
  const _Country();

  @override
  Widget build(BuildContext context) {
    return _Item(
      title: S.of(context).locationCountry,
      readOnly: true,
      icon: Icons.flag,
      hintText: S.of(context).locationCountryHint,
      controller: TextEditingController(text: S.of(context).saudiArabia),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      title: s.locationName,
      icon: Icons.title,
      hintText: s.locationNameHint,
      controller: LocationCubit.get(context).titleController,
    );
  }
}

class _Regions extends StatelessWidget {
  const _Regions();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    final cubit = LocationCubit.get(context);
    return _DropDownItem(
      title: s.locationRegion,
      hintText: s.locationRegionHint,
      items: cubit.regions,
      initialItem: cubit.selectedRegion,
      onChanged: (value) {
        if (value != null) {
          cubit.onRegionSelected(value);
        }
      },
    );
  }
}

class _City extends StatelessWidget {
  const _City();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    final cubit = LocationCubit.get(context);
    return _DropDownItem(
      title: s.locationCity,
      hintText: s.locationCityHint,
      items: cubit.selectedRegion?.cities ?? [],
      initialItem: cubit.selectedCity,
      onChanged: (value) {
        if (value != null) {
          cubit.onCitySelected(value);
        }
      },
    );
  }
}

class _District extends StatelessWidget {
  const _District();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    final cubit = LocationCubit.get(context);
    return _DropDownItem(
      title: s.locationDistrict,
      hintText: s.locationDistrictHint,
      items: cubit.selectedCity?.districts ?? [],
      initialItem: cubit.selectedDistrict,
      onChanged: (value) {
        if (value != null) {
          cubit.onDistrictSelected(value);
        }
      },
    );
  }
}

class _Street extends StatelessWidget {
  const _Street();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      title: s.locationStreet,
      icon: Icons.streetview,
      hintText: s.locationStreetHint,
      controller: LocationCubit.get(context).streetController,
    );
  }
}

class _BuildingNumber extends StatelessWidget {
  const _BuildingNumber();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      title: s.locationBuilding,
      icon: Icons.format_list_numbered,
      hintText: s.locationBuildingHint,
      controller: LocationCubit.get(context).buildingNumberController,
    );
  }
}

class _Floor extends StatelessWidget {
  const _Floor();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      title: s.locationFloor,
      icon: Icons.layers,
      hintText: s.locationFloorHint,
      keyboardType: TextInputType.number,
      controller: LocationCubit.get(context).floorController,
    );
  }
}

class _Add extends StatelessWidget {
  final bool isLoading;
  final GlobalKey<FormState> formKey;
  const _Add({super.key, required this.isLoading, required this.formKey});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return CustomButton(
      isLoading: isLoading,
      text: s.addLocationButton,
      onPressed: () => LocationCubit.get(context).addLocation(formKey: formKey),
    );
  }
}

class _Edit extends StatelessWidget {
  final bool isLoading;
  final GlobalKey<FormState> formKey;
  const _Edit({super.key, required this.isLoading, required this.formKey});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return CustomButton(
      isLoading: isLoading,
      text: s.editLocationButton,
      onPressed: () => LocationCubit.get(context).addLocation(formKey: formKey),
    );
  }
}
