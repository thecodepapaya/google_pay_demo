import 'package:flutter/material.dart';

class ShadowStyle extends StatelessWidget {
  final Widget child;

  final Offset? offset;
  final double? borderRadius;

  const ShadowStyle({
    super.key,
    required this.child,
    this.offset,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            offset: offset ?? const Offset(10, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}
