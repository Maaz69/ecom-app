import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.radius = TSizes.cardRadiusLg,
    this.backgroundColor,
    this.borderColor,
  });

  final double? width;
  final double? height;
  final double? radius;
  final Widget? child;
  final bool showBorder;
  final Color? borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color effectiveBackgroundColor = backgroundColor ?? theme.cardColor;
    final Color effectiveBorderColor = borderColor ?? theme.dividerColor;

    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(radius!),
        border: showBorder ? Border.all(color: effectiveBorderColor) : null,
      ),
      child: child,
    );
  }
}
