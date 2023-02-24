import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/utils/constants/app_image_paths.dart';
import 'package:weather_app/utils/constants/app_sizes.dart';
import 'package:weather_app/utils/constants/app_text_styles.dart';
import 'package:weather_app/widgets/city_info.dart';
import 'package:weather_app/widgets/one_day_forecast.dart';
import 'package:weather_app/widgets/search_field.dart';

class CityInfoScreen extends StatelessWidget {
  static const String routeName = "/cityInfo";

  const CityInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [AppColors.gradientStart, AppColors.gradientEnd])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          child: Text("Chicago",
                              style: AppTextStyles.cityNameBig)),
                      const SizedBox(
                          height: 200,
                          child: Image(image: AssetImage(ImagePaths.sunny))),
                      SizedBox(
                          child: Text("26°", style: AppTextStyles.degreeBig)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      OneDayForecast(
                          dayname: "Today",
                          weatherIcon: ImagePaths.clearNight,
                          degree: 27),
                      OneDayForecast(
                          dayname: "Wednesday",
                          weatherIcon: ImagePaths.clearNight,
                          degree: 27),
                      OneDayForecast(
                          dayname: "Thursday",
                          weatherIcon: ImagePaths.clearNight,
                          degree: 27),
                      OneDayForecast(
                          dayname: "Friday",
                          weatherIcon: ImagePaths.clearNight,
                          degree: 27),
                      OneDayForecast(
                          dayname: "Saturday",
                          weatherIcon: ImagePaths.clearNight,
                          degree: 27),
                      OneDayForecast(
                          dayname: "Sunday",
                          weatherIcon: ImagePaths.clearNight,
                          degree: 27),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
