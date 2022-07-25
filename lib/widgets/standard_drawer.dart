import 'package:flutter/material.dart';
import 'package:flutterxy/utils/device_type_based_on_screen.dart';
import 'package:flutterxy/utils/styles_values.dart';
import 'package:flutterxy/widgets/basic_elevated_container.dart';

class StandardDrawer extends StatelessWidget {
  const StandardDrawer({super.key, this.elevation});

  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      FlutterLogo(
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Flutterxy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: StyleValues.primaryColor,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  if (!DeviceScreen.isMonitor(context))
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 20,
                        color: StyleValues.primaryColor,
                      ),
                    ),
                ],
              ),
              ExpansionPanelList(
                elevation: 0,
                expandedHeaderPadding: EdgeInsets.zero,
                children: [
                  ExpansionPanel(
                    body: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                height: 14,
                                width: 14,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Analytics',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        BasicElevatedContainer(
                          margin: const EdgeInsets.only(bottom: 4),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          backgroundColor: StyleValues.primaryColor,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                                height: 14,
                                width: 14,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'eCommerce',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.transparent,
                    headerBuilder: (context, isExpanded) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.home_outlined,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Dashboards',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 20,
                          height: 20,
                          child: const Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    isExpanded: true,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'APPS & PAGES',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ...drawerOptionsApps.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 2),
                      child: DrawerOptionTile(
                        drawerOptions: e,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerOptionTile extends StatelessWidget {
  const DrawerOptionTile({super.key, required this.drawerOptions});

  final DrawerOptions drawerOptions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          drawerOptions.icon,
          size: 20,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          drawerOptions.title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
      ],
    );
  }
}

final List<DrawerOptions> drawerOptionsApps = [
  DrawerOptions(
    'Inbox',
    Icons.email_outlined,
  ),
  DrawerOptions(
    'Tasks',
    Icons.check_box_outlined,
  ),
  DrawerOptions(
    'Chats',
    Icons.chat_bubble_outline,
  ),
  DrawerOptions(
    'Calendar',
    Icons.calendar_month,
  ),
];

class DrawerOptions {
  DrawerOptions(this.title, this.icon);

  final String title;
  final IconData icon;
}
