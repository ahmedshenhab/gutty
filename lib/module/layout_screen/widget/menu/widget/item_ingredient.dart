

import 'package:flutter/material.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';

class ItemIngredient extends StatelessWidget {
  const ItemIngredient({super.key, required this.text, required this.number});
  final String text;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.font12Regular.copyWith(
              color: AppColor.charcoalGray,
            ),
          ),
        ),
        Flexible(
          child: Text(
            number,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.font12Medium.copyWith(
              color: AppColor.charcoalGray,
            ),
          ),
        ),
      ],
    );
  }
}
