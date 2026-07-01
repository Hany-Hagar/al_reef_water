import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../features/orders/data/models/order_model.dart';

extension OrderStatusExtension on OrderStatus {
  ({
    Color backgroundColor,
    Color textColor,
    String name,
  }) value(BuildContext context) {
    switch (this) {
      case OrderStatus.pending:
        final color = const Color(0xFFF59E0B);

        return (
          backgroundColor: color.withAlpha(35),
          textColor: color,
          name: S.of(context).pending,
        );

      case OrderStatus.confirmed:
        final color = const Color(0xFF2563EB);

        return (
          backgroundColor: color.withAlpha(35),
          textColor: color,
          name: S.of(context).confirmed,
        );

      case OrderStatus.preparing:
        final color = const Color(0xFF9333EA);

        return (
          backgroundColor: color.withAlpha(35),
          textColor: color,
          name: S.of(context).preparing,
        );

      case OrderStatus.outForDelivery:
        final color = const Color(0xFF0891B2);

        return (
          backgroundColor: color.withAlpha(35),
          textColor: color,
          name: S.of(context).outForDelivery,
        );

      case OrderStatus.delivered:
        final color = const Color(0xFF16A34A);

        return (
          backgroundColor: color.withAlpha(35),
          textColor: color,
          name: S.of(context).delivered,
        );

      case OrderStatus.cancelled:
        final color = const Color(0xFFDC2626);

        return (
          backgroundColor: color.withAlpha(35),
          textColor: color,
          name: S.of(context).cancelled,
        );
    }
  }
}