import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge(
      {super.key,
      this.notificationNumber = 0,
      required this.color,
      required this.child});

  final int notificationNumber;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          right: 2,
          top: 1,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
            ),
            width: notificationNumber > 0 ? 18 : 0,
            height: notificationNumber > 0 ? 18 : 0,
            child: Center(
              child: Text(
                notificationNumber.toString(),
                style: const TextStyle(
                  color: Color(0xffFFEBF7),
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
