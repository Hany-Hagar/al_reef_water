import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/add_edit_location_body.dart';
import '../../../../../core/widgets/custom_background.dart';
import 'package:al_reef_app/core/widgets/custom_app_bar.dart';

class AddEditLocationView extends StatelessWidget {
  final bool isEdit;
  const AddEditLocationView({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var formKey = GlobalKey<FormState>();
    return CustomBackground(
      top: CustomAppBar(
        title: isEdit ? s.editLocationTitle : s.addLocationTitle,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: AddEditLocationBody(isEdit: isEdit, formKey: formKey),
        ),
      ),
    );
  }
}
