import 'package:flutter/material.dart';
import 'package:hungman/utilities/constants.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, this.buttonTitle, this.onPress});

  final Function()? onPress;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 3.0,
        backgroundColor: kActionButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPress!,
      child: Text(
        buttonTitle!,
        style: kActionButtonTextStyle,
      ),
    );
  }
}
