import 'package:bloc_flutter/bloc/weather_bloc.dart';
import 'package:bloc_flutter/bloc/weather_state.dart';
import 'package:bloc_flutter/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _inputTextController = TextEditingController();
  final widgets = Widgets();
  final weatherBloc = WeatherBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Flutter"),
      ),
      //blocProvider makes bloc available to the childern on the tree
      body: BlocProvider(
        bloc: weatherBloc,
              child: Container(
            color: Theme.of(context).canvasColor,
            child: BlocBuilder(
              bloc: weatherBloc,
              builder: (BuildContext context, WeatherState state) {
                if (state is InitialWeatherState){
                  return widgets.buildInitialInput(_inputTextController, context);
                }else if (state is LoadingWeather){
                  return widgets.buildLoadingSpinner();
                }else if (state is WeatherLoaded){
                  return widgets.buildColumnWithData(state.weather, _inputTextController, context);
                }
              },
            ),
          ),
      ),
    );
  }

//dispose of the bloc stream when not in use
  @override
  void dispose() {
    weatherBloc.dispose();
    super.dispose();
  }
}
