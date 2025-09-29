part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class LoadingHomeState extends HomeState {
  @override
  String toString() => 'LoadingHomeState()';
}

class AddedHomeState extends HomeState {
  @override
  String toString() => 'AddedHomeState()';
}

class RemoveHomeState extends HomeState {
  @override
  String toString() => 'RemoveHomeState()';
}