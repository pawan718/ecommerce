import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hinttext,
      this.onChanged,
      this.controller,
      this.validator});
  final String hinttext;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hinttext,
            hintStyle: const TextStyle(
                fontFamily: 'GT-Regular',
                fontSize: 16,
                fontWeight: FontWeight.w400),
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
