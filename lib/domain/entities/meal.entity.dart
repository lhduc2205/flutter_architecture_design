abstract class Meal {
  const Meal({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  final int? id;
  final String name;
  final int price;
  final String image;
  final String description;
}
