import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key, required this.text, required this.imageurl});
  final String imageurl;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 37, top: 17, bottom: 17),
      color: Colors.white,
      child: Row(
        children: [
          SvgPicture.asset(
            imageurl,
            height: 40,
            width: 40,
          ),
          SizedBox(
            width: 21,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 158,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'GT-Regular',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
