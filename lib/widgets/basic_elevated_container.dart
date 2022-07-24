import 'package:flutter/material.dart';

class BasicElevatedContainer extends StatelessWidget {
  const BasicElevatedContainer({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 24,
              spreadRadius: 0,
              color: Color(0x1a22292f))
        ],
      ),
      child: child,
    );
  }
}
