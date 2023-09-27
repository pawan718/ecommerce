import 'package:ecommerce/Screens/homepage/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common_widgets/app_bold_text.dart';
import '../../common_widgets/app_button.dart';
import '../../common_widgets/app_text.dart';

class NoNotification extends StatelessWidget {
  const NoNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 36, left: 24),
              child: AppBoldText(
                fontsize: 24,
                text: 'Orders',
              ),
            ),
          ),
          SizedBox(
            height: 196,
          ),
          Center(child: SvgPicture.asset('images/Notificationbell.svg')),
          SizedBox(
            height: 29,
          ),
          AppText(
            text: 'No Notification yet',
            size: 24,
          ),
          SizedBox(
            height: 30,
          ),
          AppButton(
            text: 'Explore Categories',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
            },
          )
        ],
      ),
    ));
  }
}
