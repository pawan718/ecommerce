import 'package:ecommerce/Screens/homepage/home_screen.dart';
import 'package:ecommerce/Screens/product_screens/prodcut_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/Authentictionbloc/login_signup_bloc.dart';

class SignInDetailsOfUser extends StatefulWidget {
  const SignInDetailsOfUser(
      {super.key,
      required this.email,
      required this.password,
      required this.firstname,
      required this.lastname,
      required this.phoneno});
  final String email;
  final String firstname;
  final String password;
  final String lastname;
  final String phoneno;
  @override
  State<SignInDetailsOfUser> createState() => _SignInDetailsOfUserState();
}

class _SignInDetailsOfUserState extends State<SignInDetailsOfUser> {
  String selctedperson = "men";
  int selectedage = 10;
  List<int> ages = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: BlocConsumer<AuthenticationBloc, LoginSignupState>(
        listener: (context, state) {
          if (state is LoggedInState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else if (state is ErrorState) {
            Fluttertoast.showToast(msg: state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is Loadingstate) {
            return Center(child: CircularProgressIndicator());
          }
          return Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 161,
                  ),
                  const Text(
                    'Tell us About yourself',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'GT-Bold',
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 51,
                  ),
                  const Text(
                    'Who do you shop for ?',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'GT-Regular',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selctedperson = "men";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: selctedperson == "men"
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color(0xff9747FF),
                                  )
                                : BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                            child: const Center(child: Text('Men')),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selctedperson = "women";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: selctedperson == "women"
                                ? BoxDecoration(
                                    color: const Color(0xff9747FF),
                                    borderRadius: BorderRadius.circular(100),
                                  )
                                : BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                            child: const Center(child: Text('Women')),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 58,
                  ),
                  const Text(
                    'How old are you?',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'GT-Regular'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'dwejb',
                              hintStyle: const TextStyle(
                                  fontFamily: 'GT-Regular',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(100))),
                          value: selectedage,
                          items: ages
                              .map<DropdownMenuItem>((int value) =>
                                  DropdownMenuItem<int>(
                                      value: value, child: Text('$value')))
                              .toList(),
                          onChanged: (value) {}),
                    ],
                  ),
                ],
              ),
            ),
            BottomAppButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(SignupEvent(
                    email: widget.email,
                    password: widget.password,
                    firstname: widget.firstname,
                    gender: selctedperson,
                    age: selectedage,
                    phoneno: widget.phoneno,
                    lastname: widget.lastname));
              },
              child: const SizedBox(
                  width: double.infinity, child: Center(child: Text('finish'))),
            )
          ]);
        },
      ),
    ));
  }
}
