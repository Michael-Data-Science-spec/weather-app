import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/utils/constants/app_sizes.dart';
import 'package:weather_app/utils/constants/app_text_styles.dart';

class CityInfo extends StatelessWidget {
  final Color bgColor;
  final String imagePath;
  final String cityName;
  final VoidCallback onTap;

  const CityInfo(
      {super.key,
      required this.bgColor,
      required this.imagePath,
      required this.cityName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppSizes.cityInfoRadius),
          border: Border.all(
              color: AppColors.borderBlack,
              width: AppSizes.cityInfoRadiusWidth),
        ),
        child: SizedBox(
          height: AppSizes.cityInfoHeight,
          width: AppSizes.cityInfoWidth,
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.cityInfoPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSizes.imageSmall,
                  width: AppSizes.imageSmall,
                  child:
                      Image(fit: BoxFit.contain, image: AssetImage(imagePath)),
                ),
                const SizedBox(
                  width: AppSizes.cityInfoBetween,
                ),
                Text(
                  cityName,
                  style: AppTextStyles.cityNameSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
