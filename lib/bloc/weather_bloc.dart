import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/model/weather.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    //various events go here
    if (event is GetWeather) {
      //yield keyword is used here to output an object to the stream
      yield LoadingWeather();
      //this is were we run the fucntion to fetch weather from our api
      //we also pass in the city as weather search param
      final weather = await fetchWeatherFromApi(event.cityName);
      //and finally pass in the weather to WeatherLoaded
      yield WeatherLoaded(weather);
    }
  }

  //get data from api and return as Weather model data
  Future<Weather> fetchWeatherFromApi(String cityName) async {
    final String key = "your_key_here";
    String apiUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=${cityName},uk&appid=${key}";

    final response = await http.get(apiUrl);
    String city;
    double temp;

    switch (response.statusCode) {
      case 200:
        //request went through
        Map<String, dynamic> data = jsonDecode(response.body);
        temp = data["main"]["temp"];
        city = data["name"];

        print(data["main"]);

        break;
    }

    return Weather(cityName: city, temperature: temp);
  }
}
