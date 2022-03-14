import 'package:flutter/material.dart';
import 'package:test_project/core/widgets/card/coffe_card.dart';
import 'package:test_project/core/widgets/text/title_and_leading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoffeCard(
          child: _CoffeCardListViewBuilder(
            incomingList: ProductClass.selectedList,
          ),
        ),
        CoffeCard(
          child: _CoffeCardListViewBuilder(
            incomingList: ProductClass.productList,
            onTap: (ProductClass item) {
              newFunction(coffee: item.country, price: item.price);
            },
          ),
        )
      ],
    );
  }

  void newFunction({String coffee = "Coffee", int price = 999}) {
    setState(() {
      ProductClass.selectedList.add(
        ProductClass(country: coffee, price: price),
      );
    });
  }
}

class ProductClass {
  final String country;
  final int price;
  ProductClass({required this.country, required this.price});
  int totalAmount = 0;

  static List<ProductClass> selectedList = [];

  static List<ProductClass> productList = [
    ProductClass(country: "Almanya", price: 10),
    ProductClass(country: "Kenya", price: 50),
    ProductClass(country: "İtalya", price: 100),
  ];
}

class _CoffeCardListViewBuilder extends StatelessWidget {
  const _CoffeCardListViewBuilder({
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

//  Product class tamamen farklı bir dart dosyasına taşınack
//  Coffe card listview builder farklı bir widget olarak dışarı çıkartılacak
//  selected liste içerisinde olan bir item bir daha eklenmesin
//  Şu ana kadar kullandığımız değişken isimleri, fonskyion isimleri kullanım amacına göre refactor edilecek.
//  Listeler özelinde kullanılan toplama fonksiyonu ile total price hesaplanıp ekranın sağ alt tarafında gösterilecke.

//not repo sürekli güncel tutulsun.