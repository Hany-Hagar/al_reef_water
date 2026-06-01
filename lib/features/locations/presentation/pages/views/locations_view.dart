import 'package:flutter/material.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../widgets/locations_body.dart';
import '../../manager/location_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_background.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:getIt<LocationCubit>()..fetchLocations(),
      child: CustomBackground(
        top: CustomAppBar(
          title: 'My Locations',
        ),
        body: const LocationsBody(),
      )
    );
  }
}