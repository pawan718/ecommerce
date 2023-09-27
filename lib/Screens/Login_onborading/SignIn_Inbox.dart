import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common_widgets/app_button.dart';
import '../../common_widgets/app_text.dart';

class SignInInbox extends StatelessWidget {
  const SignInInbox({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 270,
          ),
          SvgPicture.asset('images/inbox.svg'),
          SizedBox(
            height: 32,
          ),
          const AppText(
            text: 'We Sent you an Email to reset your password.',
            size: 24,
          ),
          SizedBox(
            height: 39,
          ),
          AppButton(
            text: 'Return to Login',
            onPressed: () {},
          )
        ],
      )),
    ));
  }
}
