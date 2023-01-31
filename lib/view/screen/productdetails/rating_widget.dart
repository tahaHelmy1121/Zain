import 'package:flutter/material.dart';
import 'package:shop/core/constant/color.dart';
import 'package:velocity_x/velocity_x.dart';


class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key, required this.rating}) : super(key: key);
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.star, size: 25, color: AppColor.primaryColor),
        4.widthBox,
        '($rating)'.text.sm.softWrap(true).make(),
      ],
    );
  }
}
