// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

int totalPrice = 0;
final coffeeListbyClass = ProductClass.coffeeList;
final cartListbyClass = ProductClass.cartList;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.green),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.deepOrange,
              fontSize: 30,
            ),
          ),
        ),
        home: Scaffold(
            floatingActionButton: Text(
              "$totalPrice",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            body: Column(
              children: [
                BodyWidget(
                  child: ListView.builder(
                      itemCount: cartListbyClass.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            child: ListTile(
                          title: Text(
                            cartListbyClass[index].keys.last,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          leading: Text(
                            "${cartListbyClass[index].values.last}",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ));
                      }),
                ),
                BodyWidget(
                  child: ListView.builder(
                      itemCount: coffeeListbyClass.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            child: ListTile(
                          onTap: () {
                            ProductClass().newFunction(
                                coffee: coffeeListbyClass[index].keys.single,
                                price: coffeeListbyClass[index].values.single);
                            ProductClass().cartTotal(
                                price: coffeeListbyClass[index].values.last);
                          },
                          title: Text(coffeeListbyClass[index].keys.last),
                          leading:
                              Text("${coffeeListbyClass[index].values.last}"),
                        ));
                      }),
                ),
              ],
            )));
  }
    void newFunction({String coffee = "Coffee", int price = 999}) {
    setState(() {
      cartListbyClass.add({coffee: price});
    });
}

class ProductClass{
  static List<Map<String, int>> coffeeList = [
    {"Kenya": 10},
    {"Colombia": 20},
    {"Ethiopia": 50}
  ];
  static List<Map<String, int>> cartList = [];

    void cartTotal({required int price}) {
      totalPrice += price;
    }
  }
}

class BodyWidget extends StatelessWidget {
  final Widget child;
  const BodyWidget({Key? key, required this.child}) : super(key: key);
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

// uygulamada kullanılan temaya taşınabilecek değerlerin hepsi tema dosyasına aktarılacak.
// map ile yazılan kodlar, class seviyesine çekilip, static listede tutulacak.
// birden fazla parametre alan methotlar, isimlendirilmiş methot olarak tanımlanacak.
// dart tarafında isimlendirilmiş ve zorunlu parametre, default parametre alan methotlar.
// custom widget yapımı.
// projeyi github a ekleme.