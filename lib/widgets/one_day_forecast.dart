import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/utils/constants/app_sizes.dart';
import 'package:weather_app/utils/constants/app_text_styles.dart';

class OneDayForecast extends StatelessWidget {
  final String dayname;
  final String weatherIcon;
  final int degree;
  const OneDayForecast(
      {super.key,
      required this.dayname,
      required this.weatherIcon,
      required this.degree});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.oneDayInfoHeight,
      width: AppSizes.oneDayInfo,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width: AppSizes.dayName,
              child: Text(
                dayname,
                style: AppTextStyles.degreeSmall,
              )),
          SizedBox(
              width: AppSizes.weatherIcon,
              child: Image(image: AssetImage(weatherIcon))),
          SizedBox(
            width: AppSizes.degree,
            child: Text(
              "$degree°",
              style: AppTextStyles.degreeSmall,
            ),
          )
        ],
      ),
    );
  }
}
