import 'package:my_hartono_app/shared/shared.dart';

class Product {
  final String name;
  final double price;
  final double? realPrice;
  final String? image;
  final String? desc;
  final String? type;
  final int? quantity;
  final double? rating;
  final bool isSale;

  Product({this.rating, this.image, this.desc, this.type, this.realPrice, this.quantity, required this.name, required this.price, this.isSale = false});
}

final List<Product> dummyProducts = [
  Product(
    name: SharedString.productName,
    price: 350000,
    realPrice: 450000,
    image: "assets/images/ship.png",
    desc: 'Kursi kayu dengan desain minimalis, cocok untuk ruang tamu modern.',
    type: 'Furniture',
    quantity: 10,
    rating: 4.7,
    isSale: true
  ),
  Product(
    name: 'Meja Belajar Anak',
    price: 280000,
    realPrice: 320000,
    image: "assets/images/monitor.jpeg",
    desc: 'Meja belajar ergonomis untuk anak usia sekolah.',
    type: 'Furniture',
    quantity: 60,
    rating: 4.4,
    isSale: true
  ),
  Product(
    name: 'Rak Sepatu 3 Susun',
    price: 150000,
    image: "assets/images/cat.jpg",
    desc: 'Rak sepatu dari plastik kokoh dengan 3 susun.',
    type: 'Storage',
    quantity: 20,
    rating: 5,
    isSale: false
  ),
  Product(
    name: 'Lampu Hias Gantung',
    price: 220000,
    realPrice: 270000,
    image: 'assets/images/pjp.jpg',
    desc: 'Lampu gantung dengan cahaya hangat untuk suasana nyaman.',
    type: 'Lighting',
    quantity: 80,
    rating: 3.9,
    isSale: true
  ),
  Product(
    name: 'Bantal Sofa Lembut',
    price: 65000,
    image: 'assets/images/ship.png',
    desc: 'Bantal sofa dengan bahan lembut dan nyaman.',
    type: 'Dekorasi',
    quantity: 30,
    rating: 4,
    isSale: false
  ),
];
