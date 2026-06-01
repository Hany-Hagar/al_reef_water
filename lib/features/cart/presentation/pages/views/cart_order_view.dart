import 'package:flutter/material.dart';
import '../widgets/cart_order_body.dart';
import '../../../data/model/cart_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../../core/widgets/custom_background.dart';

class CartOrderView extends StatelessWidget {
  final CartModel cartItem;
  const CartOrderView({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: CartOrderBody(cartItem: cartItem),
    );
  }
}

class _Back extends StatelessWidget {
  final CartModel cartItem;
  const _Back({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        _Images(images: cartItem.product.images),

      ],
    );
  }
}

class _Images extends StatelessWidget {
  final List<String> images;
  const _Images({required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(images[index]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.26,
                autoPlay: false,
                viewportFraction: 0.95,
                enlargeCenterPage: true,
              ),
        ),
        SizedBox(
          height:MediaQuery.of(context).size.height * 0.74,
        ),
      ]
    );
  }
}