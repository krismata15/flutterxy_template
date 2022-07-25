import 'package:flutter/material.dart';
import 'package:flutterxy/utils/util_functions.dart';
import 'package:flutterxy/widgets/basic_elevated_container.dart';

class ProfileMenuOnAppBar extends StatelessWidget {
  const ProfileMenuOnAppBar({super.key});

  Future<void> showUserOptions(BuildContext context) async {
    final Size menuPosition = UtilFunctions.menuPositionCalculator(context);

    await showDialog<void>(
        context: context,
        barrierColor: Colors.transparent,
        builder: (_) {
          return Stack(
            children: [
              Positioned(
                right: 10,
                top: menuPosition.height,
                child: const UserOptionsMenu(),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showUserOptions(context);
      },
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Kris Mata',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'admin',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          CircleAvatar(
            backgroundColor: Colors.blueAccent.withOpacity(0.2),
            child: const Center(
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}

class UserOptionsMenu extends StatelessWidget {
  const UserOptionsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicElevatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...profileOptionsActions.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ProfileOptionTile(
                profileMenuOption: e,
              ),
            ),
          ),
          const SizedBox(
            width: 100,
            child: Divider(),
          ),
          ...profileOptionsOptions.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ProfileOptionTile(
                profileMenuOption: e,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileOptionTile extends StatelessWidget {
  const ProfileOptionTile({super.key, required this.profileMenuOption});
  final ProfileMenuOption profileMenuOption;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          profileMenuOption.icon,
          size: 18,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(profileMenuOption.title),
        const SizedBox(
          width: 24,
        ),
      ],
    );
  }
}

final List<ProfileMenuOption> profileOptionsActions = [
  ProfileMenuOption(
    'Profile',
    Icons.person_outline_outlined,
  ),
  ProfileMenuOption(
    'Inbox',
    Icons.email_outlined,
  ),
  ProfileMenuOption(
    'Tasks',
    Icons.check_box_outlined,
  ),
  ProfileMenuOption(
    'Chats',
    Icons.chat_bubble_outline,
  ),
];

final List<ProfileMenuOption> profileOptionsOptions = [
  ProfileMenuOption(
    'Settigns',
    Icons.settings,
  ),
  ProfileMenuOption(
    'Pricing',
    Icons.credit_card,
  ),
  ProfileMenuOption(
    'FAQ',
    Icons.help_outline,
  ),
  ProfileMenuOption(
    'Logout',
    Icons.exit_to_app,
  ),
];

class ProfileMenuOption {
  ProfileMenuOption(this.title, this.icon);

  final String title;
  final IconData icon;
}
