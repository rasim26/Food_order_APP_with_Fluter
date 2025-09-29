import 'package:equatable/equatable.dart';

class FoodModel extends Equatable {
  final String name;
  final int price;

  const FoodModel({required this.name, required this.price});

  @override
  List<Object?> get props => [name, price];
}
