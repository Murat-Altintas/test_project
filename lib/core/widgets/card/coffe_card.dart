import 'package:flutter/material.dart';

class CoffeCard extends StatelessWidget {
  final Widget child;
  const CoffeCard({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        color: Theme.of(context).colorScheme.primary,
        child: child,
      ),
    );
  }
}
