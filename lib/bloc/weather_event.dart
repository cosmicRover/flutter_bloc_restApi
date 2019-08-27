import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
//equatable allows for simple value equality comparison in dart
abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const <dynamic>[]]) : super(props);
}

//get weather is the only event in this app
class GetWeather extends WeatherEvent{
  final String cityName;

  GetWeather(this.cityName) : super([cityName]);
}


