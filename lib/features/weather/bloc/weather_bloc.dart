import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/repository/weather_repository.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepositoryBase _repository;

  WeatherBloc(this._repository) : super( WeatherInitialState()){
    on<LoadWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      final weather = await _repository.getWeather(event.city);
      emit(WeatherLoadingSuccessState(weather));

    });
  }





}
