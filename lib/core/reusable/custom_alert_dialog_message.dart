import 'package:flutter/material.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';

void showCustomAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  VoidCallback? onOk,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (onOk != null) onOk();
          },
          child:  Text("OK",style: AppTextStyle.font16Medium.copyWith(color: AppColor.darkgray),),
        ),
      ],
    ),
  );
}
