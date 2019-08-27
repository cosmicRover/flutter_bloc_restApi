import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart'; //for euatable

//weather model
class Weather extends Equatable {
  final String cityName;
  final double temperature;

  //constructor with required params and the passing to the super class
  Weather({@required this.cityName, @required this.temperature})
      : super([cityName, temperature]);
}
