import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../common_widgets/app_bold_text.dart';
import '../../common_widgets/app_button.dart';
import '../../common_widgets/app_text.dart';

class NoOrder extends StatelessWidget {
  const NoOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Center(child: SvgPicture.asset('images/Bookmarkfororders.svg')),
          SizedBox(
            height: 29,
          ),
          AppText(
            text: 'No Orders Yet',
            size: 24,
          ),
          SizedBox(
            height: 30,
          ),
          AppButton(text: 'Explore Categories', onPressed: () {})
        ],
      ),
    );
  }
}
