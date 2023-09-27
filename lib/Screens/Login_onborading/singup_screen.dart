import 'package:ecommerce/Screens/Login_onborading/SignIn_DetailsOfUser.dart';
import 'package:ecommerce/Screens/product_screens/prodcut_details.dart';
import 'package:ecommerce/common_widgets/app_bold_text.dart';
import 'package:ecommerce/common_widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  String email = "";
  String firstname = "";
  String lastname = "";
  String phoneno = "";
  String password = "";
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 79, left: 27),
                child: AppBoldText(text: 'Sign Up', fontsize: 32),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hinttext: 'firstname',
                onChanged: (value) {
                  firstname = value;
                },
                validator: (val) {
                  if (val!.isEmpty) return 'please enter name';
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hinttext: 'lastname',
                onChanged: (value) {
                  lastname = value;
                },
                validator: (val) {
                  if (val!.isEmpty) return 'please enter lastname';
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hinttext: 'Email',
                onChanged: (value) {
                  email = value;
                },
                validator: (val) {
                  if (val!.isEmpty) return 'please enter email';
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                  onChanged: (value) {
                    phoneno = value;
                  },
                  hinttext: 'Phone no.',
                  validator: (val) {
                    if (val!.length > 10) return 'Enter phone no.';
                    return null;
                  }),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hinttext: 'Password',
                controller: _pass,
                onChanged: (value) {
                  password = value;
                },
                validator: (val) {
                  if (val!.isEmpty) return 'please enter password';
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                  hinttext: 'Confirm password',
                  controller: _confirmPass,
                  validator: (val) {
                    if (val != _pass.text) return 'Password Does Not Match';
                    return null;
                  }),
            ],
          ),
        ),
        BottomAppButton(
          onPressed: () {
            if (_form.currentState!.validate()) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignInDetailsOfUser(
                            email: email,
                            firstname: firstname,
                            password: password,
                            lastname: lastname,
                            phoneno: phoneno,
                          )));
            }
          },
          child: const SizedBox(
              width: double.infinity, child: Center(child: Text('Next'))),
        )
      ]),
    ));
  }
}
