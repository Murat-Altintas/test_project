import 'package:flutter/material.dart';
import 'package:test_project/core/source/products.dart';

class FloatingText extends StatelessWidget {
  FloatingText({
    Key? key,
  }) : super(key: key);
  var money = ProductClass.selectedList.map((e) => e.price);
  @override
  Widget build(BuildContext context) {
    return Text(
      "${money.fold(0, (previousValue, element) => int.parse(previousValue.toString()) + int.parse(element.toString()))}",
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
