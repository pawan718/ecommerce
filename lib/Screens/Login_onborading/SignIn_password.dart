import 'package:ecommerce/Screens/homepage/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../common_widgets/app_button.dart';
import '../../common_widgets/custom_forget_or_createnew.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_text_field.dart';
import '../bloc/Authentictionbloc/login_signup_bloc.dart';

class SignInPassord extends StatelessWidget {
  SignInPassord({super.key, required this.email});
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final String email;
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<AuthenticationBloc, LoginSignupState>(
        listener: (context, state) {
          if (state is LoggedInState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          } else if (state is ErrorState) {
            Fluttertoast.showToast(msg: state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is Loadingstate) {
            return const Center(child: CircularProgressIndicator());
          }
          return Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomText(text: 'Sign in'),
                const SizedBox(
                  height: 35,
                ),
                CustomTextField(
                  validator: (val) {
                    if (val!.isEmpty) return 'please enter password';
                    return null;
                  },
                  hinttext: 'Password',
                  onChanged: (value) {
                    password = value;
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
                        context
                            .read<AuthenticationBloc>()
                            .add(LoginEvent(password: password, email: email));
                      }
                    },
                  ),
                ),
                CustomForgetorCreatenew(
                    onTap: () {},
                    firsttext: 'Forget Password?',
                    secondtext: 'Reset')
              ],
            ),
          );
        },
      ),
    ));
  }
}
