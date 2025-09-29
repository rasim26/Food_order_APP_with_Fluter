import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_food_ordering_app/models/food_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadingHomeState()) {
    on<HomeEvent>((event, emit) {
      
    });
  }
}
