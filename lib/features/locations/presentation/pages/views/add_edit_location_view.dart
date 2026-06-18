import 'package:flutter/material.dart';
import '../../manager/location_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/location_states.dart';
import '../../../../../core/utils/nav_to.dart';
import '../widgets/add_edit_location_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/location_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/services/location_service.dart';
import '../../../../../core/widgets/custom_background.dart';
import 'package:al_reef_app/core/widgets/custom_app_bar.dart';

class AddEditLocationView extends StatelessWidget {
  final bool isEdit;
  const AddEditLocationView({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var formKey = GlobalKey<FormState>();
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is AddLocationSuccess) {
          NavTo.pop(context);
        } else if (state is UpdateLocationSuccess) {
          NavTo.pop(context);
        }
      },
      child: CustomBackground(
        top: CustomAppBar(
          title: isEdit ? s.editLocationTitle : s.addLocationTitle,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: AddEditLocationBody(isEdit: isEdit, formKey: formKey),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => LocationService.openLocationPicker(
            context: context,
            onLocationPicked: (location) =>
                LocationCubit.get(context).setControllers(
                  isEditing: false,
                  location: LocationModel.fromOSM(pickedData: location),
                ),
          ),
          child: Icon(
            Icons.map_outlined,
            color: Theme.of(context).hintColor,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
