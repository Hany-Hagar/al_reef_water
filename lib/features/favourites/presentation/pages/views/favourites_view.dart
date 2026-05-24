
import '../../manager/fav_cubit.dart';
import '../../manager/fav_states.dart';
import 'package:flutter/material.dart';
import '../widgets/favourites_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/services/snack_bar_service.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FavCubit>()..fetchFavoriteProduct(),
      child: BlocListener<FavCubit, FavState>(
        listener: (context, state) {
          if (state is FavFailure) {
            SnackBarService.failure(context: context, message: state.message);
          }
        },
        child: FavouritesBody(),
      ),
    );
  }
}
