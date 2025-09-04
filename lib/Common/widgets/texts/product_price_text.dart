import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    final textStyle = isLarge
        ? Theme.of(context).textTheme.headlineMedium
        : Theme.of(context).textTheme.titleLarge;

    return Text(
      '$currencySign$price',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: textStyle?.copyWith(
        decoration: lineThrough ? TextDecoration.lineThrough : null,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
