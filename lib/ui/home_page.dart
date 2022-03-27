import 'package:flutter/material.dart';
import 'package:test_project/core/source/products.dart';
import 'package:test_project/core/widgets/card/coffe_card.dart';
import 'package:test_project/core/widgets/coffee_cart_list.dart';

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
          child: CoffeCardListViewBuilder(
            incomingList: ProductClass.selectedList,
          ),
        ),
        CoffeCard(
          child: CoffeCardListViewBuilder(
            incomingList: ProductClass.productList,
            onTap: (ProductClass item) {
              addNewCoffees(coffee: item.country, price: item.price);
            },
          ),
        )
      ],
    );
  }

  addNewCoffees({coffee, price}) {
    // if (!ProductClass.selectedList.contains(coffee)) {
    //   ProductClass.selectedList
    //       .add(ProductClass(country: coffee!, price: price!));
    // }

    bool check = false;
    ProductClass.selectedList.forEach((e) {
      if (e.country == coffee) {
        check = true;
      }
    });
    setState(() {
      if (!check) {
        ProductClass.selectedList
            .add(ProductClass(country: coffee!, price: price!));
      }
    });
  }
}





//  Product class tamamen farklı bir dart dosyasına taşınack
//  Coffe card listview builder farklı bir widget olarak dışarı çıkartılacak
//  selected liste içerisinde olan bir item bir daha eklenmesin
//  Şu ana kadar kullandığımız değişken isimleri, fonskyion isimleri kullanım amacına göre refactor edilecek.
//  Listeler özelinde kullanılan toplama fonksiyonu ile total price hesaplanıp ekranın sağ alt tarafında gösterilecke.

//not repo sürekli güncel tutulsun.