import 'package:ecommerce/Screens/bloc/get_address_bloc.dart';
import 'package:ecommerce/Screens/profile/enter_address_details.dart';
import 'package:ecommerce/common_widgets/app_bold_text.dart';
import 'package:ecommerce/common_widgets/app_text.dart';
import 'package:ecommerce/common_widgets/top_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../address_data_model.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  List<Addressdata> addresses = [];
  @override
  void initState() {
    // TODO: implement initState
    context.read<GetAddressBloc>().add(GetAddress());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const TopBackButton(),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: AppBoldText(text: 'Address', fontsize: 24),
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<GetAddressBloc, GetAddressState>(
            builder: (context, state) {
              if (state is LoadingAdress) {
                return const CircularProgressIndicator();
              } else if (state is LoadingAddressDone) {
                addresses = state.addresses;
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: addresses.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context,
                              "${addresses[index].street}, ${addresses[index].city}, ${addresses[index].state}, ${addresses[index].pincode}");
                        },
                        child: AddressComponent(
                          address:
                              "${addresses[index].street}, ${addresses[index].city}, ${addresses[index].state}, ${addresses[index].pincode}",
                        ),
                      );
                    }),
              );
            },
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnterAddressDetail()));
                  },
                  child: Text('+ Add Address'))),
        ],
      ),
    ));
  }
}

class AddressComponent extends StatelessWidget {
  const AddressComponent({
    super.key,
    required this.address,
    this.onTap,
  });

  final String address;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 12),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 18, bottom: 18, left: 17, right: 19),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 248,
              child: AppText(text: address, size: 16),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                'Edit',
                style: TextStyle(
                  color: Color(0xFF9747FF),
                  fontSize: 12,
                  fontFamily: 'GT Walsheim Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
