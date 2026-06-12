import '../../../../../generated/l10n.dart';
import 'location_item.dart';
import 'package:flutter/material.dart';
import '../../manager/location_cubit.dart';
import '../../manager/location_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/location_model.dart';
import '../../../../../core/widgets/custom_list.dart';

class LocationsBody extends StatelessWidget {
  const LocationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        var cubit = LocationCubit.get(context);
        return CustomList(
          items: cubit.locations,
          isFailure: state is LocationError,
          isLoading: state is LocationLoading,
          itemBuilder: (context, item) => LocationItem(location: item),
          emptyAnimation: "assets/lotties/emptyLocations.json",
          emptyMessage: S.of(context).noLocationsYet,
          failureMessage: (state is LocationError) ? state.message : null,
          emptyItems: List.generate(5, (index) => LocationModel.empty()),
        );
      },
    );
  }
}
