import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/constants/app_text_styles.dart';
import 'package:weather_app/utils/constants/weather_icons.dart';
import 'package:weather_app/widgets/one_day_forecast.dart';

String getImageByCode(String code) {
  switch (code) {
    case "01d":
      {
        return WeatherIcons.d1;
      }
    case "02d":
      {
        return WeatherIcons.d2;
      }
    case "03d":
      {
        return WeatherIcons.d3;
      }
    case "04d":
      {
        return WeatherIcons.d4;
      }
    case "09d":
      {
        return WeatherIcons.d9;
      }
    case "10d":
      {
        return WeatherIcons.d10;
      }
    case "11d":
      {
        return WeatherIcons.d11;
      }
    case "13d":
      {
        return WeatherIcons.d13;
      }
    case "50d":
      {
        return WeatherIcons.d50;
      }
    case "01n":
      {
        return WeatherIcons.n1;
      }
    case "02n":
      {
        return WeatherIcons.n2;
      }
    case "03n":
      {
        return WeatherIcons.n3;
      }
    case "04n":
      {
        return WeatherIcons.n4;
      }
    case "09n":
      {
        return WeatherIcons.n9;
      }
    case "10n":
      {
        return WeatherIcons.n10;
      }
    case "11n":
      {
        return WeatherIcons.n11;
      }
    case "13n":
      {
        return WeatherIcons.n13;
      }
    default:
      {
        return WeatherIcons.n50;
      }
  }
}

class CityInfoScreen extends StatelessWidget {
  static const String routeName = "/cityInfo";

  const CityInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = Provider.of<WeatherBloc>(context);

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
                            child: Text(
                                (_weatherBloc.state as WeatherLoaded)
                                    .weatherData
                                    .cityName,
                                style: AppTextStyles.cityNameBig)),
                        SizedBox(
                            height: 200,
                            child: Image(
                                image: AssetImage(getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription)))),
                        SizedBox(
                            child: Text(
                                (_weatherBloc.state as WeatherLoaded)
                                    .weatherData
                                    .day2Temperature
                                    .toString(),
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
                                degree: (_weatherBloc.state as WeatherLoaded)
                                    .weatherData
                                    .temperature
                                    .toInt()),
                            OneDayForecast(
                                dayname: "Wednesday",
                                weatherIcon: getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription2),
                                degree: (_weatherBloc.state as WeatherLoaded)
                                    .weatherData
                                    .day2Temperature
                                    .toInt()),
                            OneDayForecast(
                                dayname: "Thursday",
                                weatherIcon: getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription3),
                                degree: (_weatherBloc.state as WeatherLoaded)
                                    .weatherData
                                    .day3Temperature
                                    .toInt()),
                            OneDayForecast(
                                dayname: "Friday",
                                weatherIcon: getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription4),
                                degree: (_weatherBloc.state as WeatherLoaded)
                                    .weatherData
                                    .day4Temperature
                                    .toInt()),
                            OneDayForecast(
                                dayname: "Saturday",
                                weatherIcon: getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription5),
                                degree: (_weatherBloc.state as WeatherLoaded)
                                    .weatherData
                                    .day5Temperature
                                    .toInt()),
                            OneDayForecast(
                                dayname: "Sunday",
                                weatherIcon: getImageByCode(
                                    (_weatherBloc.state as WeatherLoaded)
                                        .weatherData
                                        .weatherDescription6),
                                degree: (_weatherBloc.state as WeatherLoaded)
                                    .weatherData
                                    .day6Temperature
                                    .toInt()),
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
