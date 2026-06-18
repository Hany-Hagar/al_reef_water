import 'add_edit_location_view.dart';
import 'package:flutter/material.dart';
import '../widgets/locations_body.dart';
import '../../manager/location_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/location_model.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/services/location_service.dart';
import '../../../../../core/widgets/custom_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return BlocProvider.value(
      value: getIt<LocationCubit>()..fetchLocations(),
      child: CustomBackground(
        top: CustomAppBar(title: s.locationsTitle),
        body: const LocationsBody(),
        floatingActionButton: const _AddLocation(),
      ),
    );
  }
}

class _AddLocation extends StatelessWidget {
  const _AddLocation();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        LocationCubit.get(context).clearControllers();
        LocationService.openLocationPicker(
          context: context,
          onLocationPicked: (pickedData) {
            LocationCubit.get(context).setControllers(
              isEditing: false,
              location: LocationModel.fromOSM(pickedData: pickedData),
            );
            NavTo.push(
              context: context,
              nextPage: const AddEditLocationView(isEdit: false),
            );
          },
        );
      },
      child: Icon(size: 34.r, Icons.add_location_alt_outlined),
    );
  }
}
