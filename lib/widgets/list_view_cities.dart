import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/utils/constants/app_image_paths.dart';
import 'package:weather_app/widgets/city_info.dart';

class CityListView extends StatelessWidget {
  final List<CityInfo> items = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: items[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          child: Divider(
            height: 0,
            color: Colors.grey,
          ),
        );
      },
      itemCount: items.length,
    );
  }
}
