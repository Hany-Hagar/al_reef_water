import '../../../../../generated/l10n.dart';
import '../../manager/fav_cubit.dart';
import '../../manager/fav_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/product_items.dart';

class FavouritesBody extends StatelessWidget {
  const FavouritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) => ProductItems(
        isLoading: state is FavLoading,
        isFailure: state is FavFailure,
        products: FavCubit.get(context).favoriteProducts,
        emptyMessage: S.of(context).noFavouritesYet,
        emptyAnimation: "assets/lotties/emptyFav.json",
        failureMessage: FavState is FavFailure
            ? (state as FavFailure).message
            : null,
      ),
    );
  }
}
