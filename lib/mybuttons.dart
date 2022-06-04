import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButtons extends StatelessWidget {
  final Color;
  final TextColor;
  final String ButtonText;
  final ButtonTabed;
  const MyButtons(
      {super.key,
      required this.Color,
      required this.TextColor,
      required this.ButtonText,
      this.ButtonTabed
      });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: ButtonTabed,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Color,
              child: Center(
                  child: Text(
                ButtonText,
                style: TextStyle(color: TextColor, fontSize: 20),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
