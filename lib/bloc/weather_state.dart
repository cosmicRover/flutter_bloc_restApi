import 'package:bloc_flutter/model/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherState extends Equatable {
  WeatherState([List props = const <dynamic>[]]) : super(props);
}

//the default state before the user interacts with the app
class InitialWeatherState extends WeatherState {}

//the loading state, while fetching weather data from api
class LoadingWeather extends WeatherState {}

//the event that comes after weather loading, contains the actual json
class WeatherLoaded extends WeatherState{
  //the data model weather
  final Weather weather;

  WeatherLoaded(this.weather) : super([weather]);

}
