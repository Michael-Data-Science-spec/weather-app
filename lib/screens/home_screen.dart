import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/utils/constants/app_image_paths.dart';
import 'package:weather_app/utils/constants/app_sizes.dart';
import 'package:weather_app/widgets/city_info.dart';
import 'package:weather_app/widgets/search_field.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  const HomeScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.cityInfoToTop),
              const SearchField(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CityInfo(
                      bgColor: AppColors.dayColor,
                      imagePath: ImagePaths.sunnyDay,
                      cityName: "Chicago",
                    ),
                    CityInfo(
                      bgColor: AppColors.nightColor,
                      imagePath: ImagePaths.sunnyDay,
                      cityName: "Beijing",
                    ),
                    CityInfo(
                      bgColor: AppColors.dayColor,
                      imagePath: ImagePaths.sunnyDay,
                      cityName: "New York",
                    ),
                    CityInfo(
                      bgColor: AppColors.nightColor,
                      imagePath: ImagePaths.sunnyDay,
                      cityName: "Toronto",
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
