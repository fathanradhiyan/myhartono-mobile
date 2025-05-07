import '../shared/shared.dart';

class OfficalBrand {
  final String title;
  final String image;
  final String backgroundImage;

  OfficalBrand({required this.title, required this.image, required this.backgroundImage});
}

final List<OfficalBrand> officialBrands = [
  OfficalBrand(
    title: "Samsung",
    image: SharedImage.profilePic,
    backgroundImage: "assets/images/pjp.jpg",
  ),
  OfficalBrand(
    title: "Akari",
    image: SharedImage.profilePic,
    backgroundImage: "assets/images/pjp.jpg",
  ),
  OfficalBrand(
    title: "Aquos",
    image: SharedImage.profilePic,
    backgroundImage: "assets/images/pjp.jpg",
  ),
];


