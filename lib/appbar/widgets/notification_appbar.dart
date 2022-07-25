import 'package:flutter/material.dart';
import 'package:flutterxy/utils/styles_values.dart';
import 'package:flutterxy/utils/util_functions.dart';
import 'package:flutterxy/widgets/basic_elevated_container.dart';
import 'package:flutterxy/widgets/notification_badge.dart';
import 'package:flutterxy/widgets/standard_button.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

  Future<void> showNotifications(BuildContext context) async {
    final Size menuPosition = UtilFunctions.menuPositionCalculator(context);

    await showDialog<void>(
        context: context,
        barrierColor: Colors.transparent,
        builder: (_) {
          return Stack(
            children: [
              Positioned(
                left: menuPosition.width,
                top: menuPosition.height,
                child: SizedBox(
                  width: UtilFunctions.menuMaxWidth(context),
                  child: const NotificationsMenu(),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationBadge(
      notificationNumber: 5,
      color: Colors.redAccent,
      child: IconButton(
        onPressed: () {
          showNotifications(context);
        },
        icon: const Icon(
          Icons.notifications_none,
        ),
      ),
    );
  }
}

class NotificationsMenu extends StatelessWidget {
  const NotificationsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BasicElevatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Chip(
                  label: const Text(
                    '5 Items',
                    style: TextStyle(
                      color: StyleValues.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  backgroundColor: StyleValues.primaryColor.withOpacity(0.2),
                ),
              ],
            ),
            const Divider(),
            ...notifications.map(
              (e) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: NotificationTile(notificationData: e),
                  ),
                  const Divider(),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const StandardButton(
              label: 'Read all notifications',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.notificationData});

  final NotificationData notificationData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: notificationData.color.withOpacity(0.2),
          child: Text(
            notificationData.initials,
            style: TextStyle(
              color: notificationData.color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${notificationData.title} ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  notificationData.extra,
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              notificationData.info,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 12,
              ),
            ),
          ],
        )
      ],
    );
  }
}

final List<NotificationData> notifications = [
  NotificationData(
    'Congratulation Sam 🎉',
    'winner!',
    'Won the monthly best seller badge.',
    'PA',
    Colors.blueAccent,
  ),
  NotificationData(
    'New message',
    'received',
    'You have 10 unread messages.',
    'AS',
    Colors.deepOrangeAccent,
  ),
  NotificationData(
    'Revised Order 👋',
    'checkout',
    'MD Inc. order updated',
    'MD',
    Colors.redAccent,
  ),
];

class NotificationData {
  NotificationData(
      this.title, this.extra, this.info, this.initials, this.color);

  final String title;
  final String extra;
  final String info;
  final String initials;
  final Color color;
}
