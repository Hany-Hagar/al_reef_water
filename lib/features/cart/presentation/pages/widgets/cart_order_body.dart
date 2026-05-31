import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../data/model/cart_model.dart';

class CartOrderBody extends StatelessWidget {
  final CartModel cartItem;
  const CartOrderBody({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Images(images: cartItem.product.images),
        const SizedBox(height: 20),
        Text(
          cartItem.product.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          'Price: \$${cartItem.product.price * cartItem.quantity}',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class _Images extends StatelessWidget {
  final List<String> images;
  const _Images({required this.images});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(images[index]),
                )
              );
            },
          ),
        ),
        CustomAppBar(title: '', backgroundColor: Colors.transparent),
      ],
    );
  }
}
