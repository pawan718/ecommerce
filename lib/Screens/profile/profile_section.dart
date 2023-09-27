import 'package:ecommerce/Screens/Login_onborading/SIgnIn_Email.dart';
import 'package:ecommerce/Screens/homepage/notification_screen.dart';
import 'package:ecommerce/Screens/profile/edit_address.dart';
import 'package:ecommerce/Screens/profile/wishlist_screen.dart';
import 'package:ecommerce/Screens/user_details_model.dart';
import 'package:ecommerce/common_widgets/app_bold_text.dart';
import 'package:ecommerce/common_widgets/app_text.dart';
import 'package:ecommerce/Screens/bloc/UserDetailsBloc/user_details_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../common_widgets/profile_list_component.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    context.read<UserDetailsBloc>().add(finduserdetails());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: BlocBuilder<UserDetailsBloc, UserDetailsState>(
        builder: (context, state) {
          UserDetailsModel details = UserDetailsModel(
            email: '',
            firstname: '',
            lastname: '',
            phoneno: '',
          );
          if (state is UserDetailsLoading) {
            return const ProfileLoadingShimmer();
          } else if (state is UserDetailsLoadingDone) {
            details = state.userdetails;
          }
          return Column(
            children: [
              const SizedBox(
                height: 82,
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE4D7F5),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(26),
                      child: AppBoldText(
                          text: "${details.firstname[0]}${details.lastname[0]}",
                          fontsize: 24)),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 13, left: 16, right: 19, bottom: 13),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppBoldText(
                            text: details.firstname,
                            fontsize: 16,
                            color: const Color(0xFF050505),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            details.email,
                            style: const TextStyle(
                              color: Color(0x7F050505),
                              fontSize: 16,
                              fontFamily: 'GT-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            details.phoneno,
                            style: const TextStyle(
                              color: Color(0x7F050505),
                              fontSize: 16,
                              fontFamily: 'GT-Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        'Edit',
                        style: TextStyle(
                          color: Color(0xFF9747FF),
                          fontSize: 12,
                          fontFamily: 'GT Walsheim Pro',
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              ProfileListComponent(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditAddress()));
                },
                text: 'Address',
              ),
              ProfileListComponent(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
                text: 'Notification',
              ),
              ProfileListComponent(
                text: 'Wishlist',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WishList()));
                },
              ),
              const SizedBox(
                height: 99,
              ),
              TextButton(
                  onPressed: () async {
                    await _firebaseAuth.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignInEmail()));
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Color(0xFFFB6565),
                      fontSize: 16,
                      fontFamily: 'GT Walsheim Pro',
                      fontWeight: FontWeight.w700,
                    ),
                  ))
            ],
          );
        },
      ),
    ));
  }
}

class ProfileLoadingShimmer extends StatelessWidget {
  const ProfileLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        children: [
          const SizedBox(
            height: 82,
          ),
          Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 96,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 56,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 56,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 56,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
