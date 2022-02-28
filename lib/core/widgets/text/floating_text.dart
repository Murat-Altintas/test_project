import 'package:flutter/material.dart';

class FloatingText extends StatelessWidget {
  const FloatingText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "totalPrice",
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
