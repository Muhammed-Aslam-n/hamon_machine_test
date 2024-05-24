import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/app_assets.dart';
import 'package:hamon_machine_task/core/utils/app_routes.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final List<String> drawerItemList = [
    'Home',
    'Invite Friends',
    'About',
    'Terms and Condition',
    'Privacy Policy',
  ];

  final List<String> drawerImages = [
    'assets/icons/home.png',
    'assets/icons/invitation.png',
    'assets/icons/info.png',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: context.theme.primaryColor,
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.appIcon,
                      width: MediaQuery.of(context).size.width * 0.14,
                      color: const Color(0xFFf8f8f8),
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            'Academy',
                            style: TextStyle(
                              color: Color(0xFFf8f8f8),
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Text(
                          'Log the Future',
                          style: TextStyle(
                            color: Color(0xFFf8f8f8),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          for (var drawerIndex = 0;
              drawerIndex < drawerItemList.length;
              drawerIndex++)
            DrawerItemWidget(
              onTap: () => changeThePage(drawerIndex, context),
              leadingItemUrl: drawerImages[drawerIndex],
              titleText: drawerItemList[drawerIndex],
              isIcon: drawerIndex == 3 || drawerIndex == 4,
              iconData:
                  drawerIndex == 3 ?  Icons.description_outlined:Icons.privacy_tip_outlined,
              index: drawerIndex,
            ),
          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'All Right Reserved ©',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  changeThePage(index, BuildContext context) {
    context.pop();
    switch (index) {
      case 0:
        break;
      case 1:
        context.pushNamed(AppRoutes.inviteFriendsScreen.name);
        break;
      case 2:
        context.pushNamed(AppRoutes.aboutScreen.name);
        break;

      case 3:
        context.pushNamed(AppRoutes.termsAndCondition.name);
        break;
      case 4:
        context.pushNamed(AppRoutes.privacyPolicy.name);
        break;
    }
  }
}

class DrawerItemWidget extends StatelessWidget {
  final Function()? onTap;
  final String? leadingItemUrl;
  final String? titleText;
  final int index;
  final bool? isIcon;
  final IconData? iconData;

  const DrawerItemWidget({
    super.key,
    this.onTap,
    this.leadingItemUrl,
    this.titleText,
    required this.index,
    this.isIcon = false,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        onTap: onTap,
        tileColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        leading: isIcon!?Icon(iconData):AspectRatio(
            aspectRatio: index == 1
                ? 0.5 / 1.68
                : index == 2
                    ? 0.5 / 1.2
                    : 0.5 / 1.5,
            child: Image.asset(
              leadingItemUrl ?? '',
              height: 30,
              width: 30,
              // color: Theme.of(context).highlightColor,
            )),
        title: Text(
          titleText ?? '',
          // color: Theme
          //     .of(context)
          //     .highlightColor,
        ),
      ),
    );
  }
}
