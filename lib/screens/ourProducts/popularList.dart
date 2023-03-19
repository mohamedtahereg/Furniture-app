import '../../models/product_model.dart';

List<ProductModel> lsit1 = [
  ProductModel(
    productName: "Blue Chair Large",
    numberOfStrars: 4,
    price: 159.99,
    productType: "Chairs",
    image: "assets/chair2.png",
    myIndex: 0,
  ),
  ProductModel(
    productName: "modern chair",
    numberOfStrars: 5,
    price: 189.99,
    productType: "Chairs",
    image: "assets/chair3.png",
    myIndex: 1,
  ),
  ProductModel(
    productName: "Creamy Chair Large",
    numberOfStrars: 5,
    price: 130,
    productType: "Chairs",
    image: "assets/chair1.png",
    myIndex: 2,
  ),
];

// double countPrice(double totalPrice) {
//   for (int i = 0; i <= lsit1.length; i++) {
//     totalPrice += lsit1[i] as double;
//   }
//   return totalPrice;
// }
