import 'package:glass/glass.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Widget? top;
  final Widget? drawer;
  final Widget body;
  final Widget? bottom;
  final Widget? floatingActionButton;
  const CustomBackground({
    super.key,
    this.top,
    this.drawer,
    required this.body,
    this.bottom,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.5),
        ),

        // المحتوى الرئيسي
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: drawer,
          body: Column(
            children: [
              ?top,
              Expanded(child: body),
            ],
          ),
          bottomNavigationBar: bottom,
          floatingActionButton: floatingActionButton,
        ).asGlass(),
      ],
    );
  }
}
