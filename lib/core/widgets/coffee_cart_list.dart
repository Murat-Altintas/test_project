import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/source/products.dart';
import 'package:test_project/core/widgets/text/title_and_leading.dart';

class CoffeCardListViewBuilder extends StatelessWidget {
  const CoffeCardListViewBuilder({
    Key? key,
    this.onTap,
    required this.incomingList,
  }) : super(key: key);

  final void Function(ProductClass item)? onTap;
  final List<ProductClass> incomingList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: incomingList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = incomingList[index];
        return Card(
            child: ListTile(
          onTap: () => onTap?.call(item),
          title: TitleText(item: item),
          leading: LeadingText(item: item),
        ));
      },
    );
  }
}
