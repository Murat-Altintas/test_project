import 'package:flutter/material.dart';

import '../../../main.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    required this.item,
  });

  final ProductClass item;

  @override
  Widget build(BuildContext context) {
    return Text(
      item.country ?? '',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}

class LeadingText extends StatelessWidget {
  const LeadingText({
    required this.item,
  });

  final ProductClass item;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${item.price}",
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
