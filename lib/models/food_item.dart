class FoodItem {
  final String id;
  final String name;
  final String price;
  final String imagePath;

  FoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

