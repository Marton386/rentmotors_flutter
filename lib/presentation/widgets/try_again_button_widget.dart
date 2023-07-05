import '../../res/global.dart';
import 'package:flutter/material.dart';

class TryAgainButtonWidget extends StatelessWidget {
  const TryAgainButtonWidget({
    Key? key,
    required this.text,
    required this.tryAgain,
  }) : super(key: key);
  final String text;
  final VoidCallback tryAgain;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => tryAgain(),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(0, 0),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(Global.buttonText),
        backgroundColor: MaterialStateProperty.all<Color>(Global.orange),
        foregroundColor: MaterialStateProperty.all<Color>(Global.backgroundLightTheme),
      ),
      child: Text(text),
    );
  }
}