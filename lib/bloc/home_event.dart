part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class AddHomeEvent extends HomeEvent {
  final FoodModel food;

  const AddHomeEvent(this.food);

  @override
  String toString() => 'AddHomeEvent';
}

class RemoveHomeEvent extends HomeEvent {
  final String foodname;

  const RemoveHomeEvent(this.foodname);

  @override
  String toString() => 'RemoveHomeEvent';
}