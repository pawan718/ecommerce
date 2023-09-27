import 'package:ecommerce/Screens/bloc/save_address_bloc.dart';
import 'package:ecommerce/Screens/homepage/checkout_add_address_screen.dart';
import 'package:ecommerce/Screens/product_screens/prodcut_details.dart';
import 'package:ecommerce/common_widgets/app_bold_text.dart';
import 'package:ecommerce/common_widgets/custom_text_field.dart';
import 'package:ecommerce/common_widgets/top_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterAddressDetail extends StatelessWidget {
  EnterAddressDetail({super.key});
  String street = "";
  String city = "";
  String state = "";
  String pincode = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBackButton(),
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 26),
              child: AppBoldText(text: 'Add Address', fontsize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
                onChanged: (value) {
                  street = value;
                },
                hinttext: 'Street Address'),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
                onChanged: (value) {
                  city = value;
                },
                hinttext: 'City'),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        state = value;
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'state',
                          hintStyle: TextStyle(
                              fontFamily: 'GT-Regular',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        pincode = value;
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Zip Code',
                          hintStyle: TextStyle(
                              fontFamily: 'GT-Regular',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        BottomAppButton(
          onPressed: () {
            context.read<SaveAddressBloc>().add(SaveAddress(
                state: state, city: city, pincode: pincode, street: street));
          },
          child: const SizedBox(
              width: double.infinity, child: Center(child: Text('Save'))),
        )
      ]),
    ));
  }
}
