import 'package:bloc_flutter/bloc/weather_bloc.dart';
import 'package:bloc_flutter/bloc/weather_event.dart';
import 'package:bloc_flutter/model/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//list of widgets that we will be using
class Widgets {
  Column buildColumnWithData(
      Weather weather, TextEditingController _inputTextController, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            "${weather.cityName} is now ${weather.temperature}",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        TextField(
          controller: _inputTextController,
          decoration: InputDecoration(helperText: "Seach for a city"),
          onEditingComplete: () => callGetWeather(context, _inputTextController)
        )
      ],
    );
  }

  Widget buildLoadingSpinner() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildInitialInput(
      TextEditingController _inputTextController, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            "City name: Temp",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        TextField(
          controller: _inputTextController,
          decoration: InputDecoration(helperText: "Seach for a city"),
          onEditingComplete: () => callGetWeather(context, _inputTextController),
        ),
      ],
    );
  }

//since we used blocProvider in the main class, we can access that bloc to dispatch functions within the bloc itself
  void callGetWeather(
      BuildContext context, TextEditingController _inputTextController) {
    final bloc = BlocProvider.of<WeatherBloc>(context);
    bloc.dispatch(GetWeather(_inputTextController.text));
  }
}
