import 'package:ecommerce/Screens/Login_onborading/SignIn_Inbox.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/app_button.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_text_field.dart';

class SignInForgetPassword extends StatelessWidget {
  const SignInForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomText(text: 'Forget Password'),
          SizedBox(
            height: 35,
          ),
          CustomTextField(hinttext: 'Enter Email address'),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AppButton(
              text: 'Continue',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInInbox()));
              },
            ),
          ),
        ],
      ),
    ));
  }
}
