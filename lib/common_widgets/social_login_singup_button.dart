import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SocialLoginSingnupButton extends StatelessWidget {
  const SocialLoginSingnupButton(
      {super.key, required this.text, required this.type});
  final String text;
  final SocialLoginButtonType type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: SocialLoginButton(
        text: text,
        borderRadius: 100,
        buttonType: type,
        onPressed: () {},
      ),
    );
  }
}
