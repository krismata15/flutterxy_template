import 'package:flutter/material.dart';
import 'package:flutterxy/appbar/widgets/cart_products.dart';
import 'package:flutterxy/appbar/widgets/notification_appbar.dart';
import 'package:flutterxy/appbar/widgets/profile_appbar.dart';
import 'package:flutterxy/utils/device_type_based_on_screen.dart';
import 'package:flutterxy/utils/styles_values.dart';
import 'package:flutterxy/utils/util_functions.dart';
import 'package:flutterxy/widgets/basic_elevated_container.dart';
import 'package:flutterxy/widgets/notification_badge.dart';

class StandardAppBar extends StatelessWidget {
  const StandardAppBar({super.key});

  Future<void> showCartInfo(BuildContext context) async {
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
                  child: const CartProductsMenu(),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: BasicElevatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(
            horizontal: 10, vertical: DeviceScreen.isMonitor(context) ? 10 : 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (!DeviceScreen.isMonitor(context))
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                    ),
                  )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.brightness_2_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                Builder(builder: (buildContext) {
                  return NotificationBadge(
                    notificationNumber: 4,
                    color: StyleValues.primaryColor,
                    child: IconButton(
                      onPressed: () {
                        showCartInfo(buildContext);
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    ),
                  );
                }),
                const NotificationAppBar(),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: ProfileMenuOnAppBar(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
