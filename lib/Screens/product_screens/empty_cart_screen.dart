import 'package:ecommerce/Screens/homepage/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common_widgets/app_bold_text.dart';
import '../../common_widgets/app_button.dart';
import '../../common_widgets/app_text.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(top: 36, left: 24),
                child: SvgPicture.asset('images/back_button.svg')),
          ),
          const SizedBox(
            height: 196,
          ),
          Center(child: SvgPicture.asset('images/cart.svg')),
          const SizedBox(
            height: 29,
          ),
          const AppText(
            text: 'Your cart is empty',
            size: 24,
          ),
          const SizedBox(height: 50,),
          const SizedBox(
            height: 30,
          ),
          AppButton(
            text: 'Explore Categories',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          )
        ],
      ),
    );
  }
}
