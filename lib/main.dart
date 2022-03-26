import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_project/core/design/app_theme.dart';
import 'package:test_project/core/widgets/card/coffe_card.dart';
import 'package:test_project/ui/home_page.dart';

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
      theme: AppTheme.themeData,
      home: Scaffold(
          floatingActionButton: FloatingText(), body: const HomePage()),
    );
  }
}



  //  Burada static bir liste oluşturulacak
  //  Listenin ilk değeri [] boş olacak. Yeni eklenen itemler buraya eklenecek.
  // void cartTotal({required int price}) {
  //   totalPrice += price;
  // }
// 1- uygulamada kullanılan temaya taşınabilecek değerlerin hepsi tema dosyasına aktarılacak.
// 2- Title, Leading için farklı text widgetları oluşturulur, string parametresi alır.
// 3- Boş listeye eklenen ürünlerin toplamını total amount değerine atayan bir metot yazılacak.
