import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const String routeName = "/test";

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = Provider.of<WeatherBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
        ),
        body: Builder(builder: (BuildContext context) {
          if (_weatherBloc.state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_weatherBloc.state is WeatherLoaded) {
            final data = (_weatherBloc.state as WeatherLoaded).weatherData;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.cityName,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16),
                Text(
                  '${data.temperature.toStringAsFixed(1)} °C',
                  style: const TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 16),
                Text(
                  data.weatherDescription,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            );
          } else if (_weatherBloc.state is WeatherError) {
            return Center(
              child: Text(
                (_weatherBloc.state as WeatherError).errorMessage,
                style: const TextStyle(fontSize: 18),
              ),
            );
          } else {
            return Center(
              child: Text(
                """${_weatherBloc.state is WeatherLoading}\n
                ${_weatherBloc.state is WeatherLoaded}\n
                ${_weatherBloc.state is WeatherLoading}\n
                ${_weatherBloc.state}\n
                """,
                style: const TextStyle(fontSize: 18),
              ),
            );
          }
        }));
  }
}
