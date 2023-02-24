import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/screens/city_info_screen.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/utils/constants/app_image_paths.dart';
import 'package:weather_app/utils/constants/cached_data.dart';
import 'package:weather_app/widgets/city_info.dart';

class CityListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = Provider.of<WeatherBloc>(context);
    List<CityInfo?> items = new List<CityInfo?>.filled(0, null, growable: true);
    for (int i = 0; i < cachedData.length; i++) {
      items.add(CityInfo(
        bgColor: AppColors.dayColor,
        imagePath: getImageByCode(cachedData[i].weatherDescription),
        cityName: cachedData[i].cityName,
        onTap: () => {
          Navigator.pushNamed(context, CachedDataScreen.routeName, arguments: i)
        },
      ));
    }
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
