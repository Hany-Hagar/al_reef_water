import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/icon_broken.dart';
import '../../../../favourites/presentation/manager/fav_cubit.dart';
import '../../../../favourites/presentation/manager/fav_states.dart';

class FavouriteIcon extends StatelessWidget {
  final String productId;
  const FavouriteIcon({super.key , required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        bool isFavorite = FavCubit.get(context).isFav(productId);
        return GestureDetector(
          onTap: () => FavCubit.get(context).toggleFav(productId),
          child: Icon(
            isFavorite ? IconBroken.Heart : IconBroken.Heart,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}
