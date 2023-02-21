import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/widgets/search_field.dart';

class TestScreen extends StatelessWidget {
  static const String routeName = "/test";

  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SearchField()),
    );
  }
}
