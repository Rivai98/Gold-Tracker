import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textButton;
  final Color textButtonColor;
  final Color backColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.textButton,
    required this.textButtonColor,
    required this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: backColor,
       
        minimumSize: Size(MediaQuery.of(context).size.width - 36, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        textButton,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 21.0,
          color: textButtonColor, 
        ),
      ),
    );
  }
}
