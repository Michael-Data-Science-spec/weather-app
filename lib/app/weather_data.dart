import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  final String cityName;
  final double temperature;
  final double day2Temperature;
  final double day3Temperature;
  final double day4Temperature;
  final double day5Temperature;
  final double day6Temperature;
  final String weatherDescription;
  final String weatherDescription2;
  final String weatherDescription3;
  final String weatherDescription4;
  final String weatherDescription5;
  final String weatherDescription6;

  WeatherData(
      {required this.cityName,
      required this.temperature,
      required this.day2Temperature,
      required this.day3Temperature,
      required this.day4Temperature,
      required this.day5Temperature,
      required this.day6Temperature,
      required this.weatherDescription,
      required this.weatherDescription2,
      required this.weatherDescription3,
      required this.weatherDescription4,
      required this.weatherDescription5,
      required this.weatherDescription6});
}
