import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/app/weather_data.dart';
import 'dart:convert';

class GetWeather extends WeatherEvent {
  final String city;

  GetWeather({required this.city});
}

List<WeatherData> cachedData = [];

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final apiKey = '124f9c561b83421a4d197af17e7df5e7';

  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeather>((event, emit) async {
      emit(WeatherLoading());
      final apiUrl =
          "https://api.openweathermap.org/data/2.5/forecast?q=${event.city}&cnt=40&appid=$apiKey&units=metric";
      try {
        final response = await http.get(Uri.parse(apiUrl));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final cityName = data['city']['name'];
          final temperature = data['list'][0]['main']['temp'];
          final weatherDescription = data['list'][0]['weather'][0]['icon'];
          final day2 = data['list'][7]['main']['temp'];
          final weatherDescription2 = data['list'][7]['weather'][0]['icon'];
          final day3 = data['list'][15]['main']['temp'];
          final weatherDescription3 = data['list'][15]['weather'][0]['icon'];
          final day4 = data['list'][23]['main']['temp'];
          final weatherDescription4 = data['list'][23]['weather'][0]['icon'];
          final day5 = data['list'][31]['main']['temp'];
          final weatherDescription5 = data['list'][31]['weather'][0]['icon'];
          final day6 = data['list'][39]['main']['temp'];
          final weatherDescription6 = data['list'][39]['weather'][0]['icon'];
          final weatherData = WeatherData(
            day2Temperature: day2,
            day3Temperature: day3,
            day4Temperature: day4,
            day5Temperature: day5,
            day6Temperature: day6,
            cityName: cityName,
            temperature: temperature,
            weatherDescription: weatherDescription,
            weatherDescription2: weatherDescription2,
            weatherDescription3: weatherDescription3,
            weatherDescription4: weatherDescription4,
            weatherDescription5: weatherDescription5,
            weatherDescription6: weatherDescription6,
          );
          emit(WeatherLoaded(weatherData));
          // Cache the last 5 weather data states
          cachedData.add(weatherData);
          if (cachedData.length > 5) {
            cachedData.removeAt(0);
          }
        } else {
          throw Exception(
              'Failed to fetch weather data ${response.statusCode}');
        }
      } catch (error) {
        emit(WeatherError('Failed to fetch weather data: ${error.toString()}'));
      }
    });
  }
}

abstract class WeatherEvent {}

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherData weatherData;

  WeatherLoaded(this.weatherData);
}

class WeatherError extends WeatherState {
  final String errorMessage;

  WeatherError(this.errorMessage);
}
