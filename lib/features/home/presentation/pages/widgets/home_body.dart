import 'package:flutter/material.dart';
import '../../manager/product_cubit.dart';
import '../../manager/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/product_items.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        var isLoading = state is ProductLoading;
        var isFailure = state is ProductFailure;
        var cubit = ProductCubit.get(context);
        return TabBarView(children: [
          ProductItems(
            isLoading: isLoading,
            isFailure: isFailure,
            products: cubit.userProducts,

          ),
          ProductItems(
            isLoading: isLoading,
            isFailure: isFailure,
            products: cubit.mosqueProducts,
          ),
          ProductItems(
            isLoading: isLoading,
            isFailure: isFailure,
            products: cubit.companyProducts,
          ),
        ]);
      },
    );
  }
}


