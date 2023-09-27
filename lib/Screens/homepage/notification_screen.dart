import 'package:flutter/material.dart';
import '../../common_widgets/app_bold_text.dart';
import '../../common_widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 36),
                child: AppBoldText(fontsize: 24, text: 'Notification'),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            NotificationCard(
                text:
                    'Jasmine, you placed and order check your order history for full details',
                imageurl: 'images/notificatiobing.svg'),
            SizedBox(
              height: 8,
            ),
            NotificationCard(
                text:
                    'Jasmine, Thank you for shopping with us we have canceled order #24568.',
                imageurl: 'images/notificationwithoutbing.svg'),
            SizedBox(
              height: 8,
            ),
            NotificationCard(
                text:
                    'Jasmine, your Order #24568 has been  confirmed check  your order history for full details',
                imageurl: 'images/notificationwithoutbing.svg')
          ],
        ),
      ),
    ));
  }
}
