import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/screens/city_info_screen.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/constants/app_text_styles.dart';
import 'package:weather_app/widgets/one_day_forecast.dart';

class CachedDataScreen extends StatelessWidget {
  static const String routeName = "/cached";

  const CachedDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    final _weatherBloc = Provider.of<WeatherBloc>(context);
    final _cachedData = cachedData[index];

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [AppColors.gradientStart, AppColors.gradientEnd])),
        child: Scaffold(
            appBar: AppBar(backgroundColor: AppColors.gradientStart),
            backgroundColor: Colors.transparent,
            body: SafeArea(child: Builder(builder: (BuildContext context) {
              if (_weatherBloc.state is WeatherLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (_weatherBloc.state is WeatherLoaded) {
                return Center(
                    child: Column(children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            child: Text(_cachedData.cityName,
                                style: AppTextStyles.cityNameBig)),
                        SizedBox(
                            height: 200,
                            child: Image(
                                image: AssetImage(getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription)))),
                        SizedBox(
                            child: Text(_cachedData.day2Temperature.toString(),
                                style: AppTextStyles.degreeBig)),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            OneDayForecast(
                                dayname: "Today",
                                weatherIcon: getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription),
                                degree: _cachedData.temperature.toInt()),
                            OneDayForecast(
                                dayname: "Wednesday",
                                weatherIcon: getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription2),
                                degree: _cachedData.day2Temperature.toInt()),
                            OneDayForecast(
                                dayname: "Thursday",
                                weatherIcon: getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription3),
                                degree: _cachedData.day3Temperature.toInt()),
                            OneDayForecast(
                                dayname: "Friday",
                                weatherIcon: getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription4),
                                degree: _cachedData.day4Temperature.toInt()),
                            OneDayForecast(
                                dayname: "Saturday",
                                weatherIcon: getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription5),
                                degree: _cachedData.day5Temperature.toInt()),
                            OneDayForecast(
                                dayname: "Sunday",
                                weatherIcon: getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription6),
                                degree: _cachedData.day6Temperature.toInt()),
                          ]))
                ]));
              } else if (_weatherBloc.state is WeatherError) {
                return Center(
                  child: Text(
                    (_weatherBloc.state as WeatherError).errorMessage,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    "Exception",
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
            }))));
  }
}
