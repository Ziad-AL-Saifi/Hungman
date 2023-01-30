import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class WordButton extends StatelessWidget {
  WordButton({this.buttonTitle, this.onPress});

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
      onPressed: onPress,
      child: Text(
        buttonTitle!,
        textAlign: TextAlign.center,
        style: kWordButtonTextStyle,
      ),
    );
  }
}
