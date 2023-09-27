import 'package:ecommerce/common_widgets/app_button.dart';
import 'package:flutter/material.dart';

class OrderSuccessfullyPlaced extends StatelessWidget {
  const OrderSuccessfullyPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF9747FF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 157),
            child: Center(
              child: SizedBox(
                  width: 256,
                  height: 202,
                  child: Image.asset('images/orderplaced.png')),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Order Placed Successfully',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF050505),
                      fontSize: 32,
                      fontFamily: 'GT Walsheim Pro',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Text(
                    'You will recieve an email confirmation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0x7F050505),
                      fontSize: 16,
                      fontFamily: 'GT Walsheim Pro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: AppButton(
                      text: 'see order details',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
