import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_project/core/widgets/card/coffe_card.dart';

import 'core/widgets/text/floating_text.dart';
import 'core/widgets/text/title_and_leading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: Colors.pinkAccent[100]),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.deepPurple,
            fontSize: 30,
          ),
          bodyText2: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 30,
          ),
        ),
      ),
      home: Scaffold(
        floatingActionButton: const FloatingText(),
        body: Column(
          children: [
            CoffeCard(
              child: _CoffeCardListViewBuilder(
                incomingList: ProductClass.selectedList,
              ),
            ),
            CoffeCard(
              child: _CoffeCardListViewBuilder(
                incomingList: ProductClass.productList,
                onTap: () => newFunction(
                  coffee: ProductClass.productList.first.country.toString(),
                  price: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void newFunction({String coffee = "Coffee", int price = 999}) {
    setState(() {
      ProductClass.selectedList
          .add(ProductClass(country: coffee, price: price));
    });
  }
}

class _CoffeCardListViewBuilder extends StatelessWidget {
  const _CoffeCardListViewBuilder({
    Key? key,
    this.onTap,
    required this.incomingList,
  }) : super(key: key);

  final void Function()? onTap;
  final List<ProductClass> incomingList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: incomingList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = incomingList[index];
        return Card(
            child: ListTile(
          onTap: onTap,
          title: TitleText(item: item),
          leading: LeadingText(item: item),
        ));
      },
    );
  }
}

class ProductClass {
  final String? country;
  final int? price;

  ProductClass({required this.country, required this.price});

  int totalAmount = 0;

  static List<ProductClass> selectedList = [];

  //  Burada static bir liste oluşturulacak
  //  Listenin ilk değeri [] boş olacak. Yeni eklenen itemler buraya eklenecek.

  static List<ProductClass> productList = [
    ProductClass(country: "Kenya", price: 10),
    ProductClass(country: "Almanya", price: 50),
    ProductClass(country: "İtalya", price: 100),
  ];

  // void cartTotal({required int price}) {
  //   totalPrice += price;
  // }
}

// 1- uygulamada kullanılan temaya taşınabilecek değerlerin hepsi tema dosyasına aktarılacak.
// 2- Title, Leading için farklı text widgetları oluşturulur, string parametresi alır.
// 3- Boş listeye eklenen ürünlerin toplamını total amount değerine atayan bir metot yazılacak.
