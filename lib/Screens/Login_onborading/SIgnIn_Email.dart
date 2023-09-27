import 'package:ecommerce/Screens/Login_onborading/SignIn_DetailsOfUser.dart';
import 'package:ecommerce/Screens/Login_onborading/SignIn_password.dart';
import 'package:ecommerce/Screens/Login_onborading/singup_screen.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import '../../common_widgets/app_button.dart';
import '../../common_widgets/custom_forget_or_createnew.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_text_field.dart';
import '../../common_widgets/social_login_singup_button.dart';

class SignInEmail extends StatelessWidget {
  String email = "";
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  SignInEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffF5F5F5),
        body: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomText(
                text: 'Sign in',
              ),
              const SizedBox(
                height: 35,
              ),
              CustomTextField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'please enter email';
                  }
                  return null;
                },
                hinttext: 'Email Address',
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppButton(
                  text: 'Continue',
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPassord(
                                    email: email,
                                  )));
                    }
                  },
                ),
              ),
              CustomForgetorCreatenew(
                firsttext: "Dont have an account?",
                secondtext: 'Create One',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
              ),
              const SizedBox(
                height: 67,
              ),
              const SocialLoginSingnupButton(
                text: 'Continue with Apple',
                type: SocialLoginButtonType.apple,
              ),
              const SizedBox(
                height: 12,
              ),
              const SocialLoginSingnupButton(
                text: 'Continue with Google',
                type: SocialLoginButtonType.google,
              ),
              const SizedBox(
                height: 12,
              ),
              const SocialLoginSingnupButton(
                text: 'Continue with Facebook',
                type: SocialLoginButtonType.facebook,
              )
            ],
          ),
        ),
      ),
    );
  }
}
