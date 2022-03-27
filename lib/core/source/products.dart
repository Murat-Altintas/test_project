class ProductClass {
  final String? country;
  final int? price;
  ProductClass({this.country, this.price});
  int totalAmount = 0;

  static List<ProductClass> selectedList = [];

  static List<ProductClass> productList = [
    ProductClass(country: "Almanya", price: 10),
    ProductClass(country: "Kenya", price: 50),
    ProductClass(country: "İtalya", price: 100),
  ];
}
