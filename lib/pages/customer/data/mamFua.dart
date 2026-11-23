import 'package:latlong2/latlong.dart';

class MamFua {
  final String name;
  final LatLng position;
  final String price;
  final double rating;

  const MamFua({
    required this.name,
    required this.position,
    this.price = "500",
    this.rating = 0.0,
  });
}

const List<MamFua> kMamFuaList = [
  MamFua(
    name: "Mama Sarah",
    position: LatLng(-1.2910, 36.8225),
    rating: 4.8,
    price: "500",
  ),
  MamFua(
    name: "Mama Jane",
    position: LatLng(-1.2930, 36.8210),
    rating: 4.5,
    price: "600",
  ),
  MamFua(
    name: "Mama Mary",
    position: LatLng(-1.2925, 36.8230),
    rating: 4.2,
    price: "450",
  ),
];
