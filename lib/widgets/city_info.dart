import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/utils/constants/app_image_paths.dart';
import 'package:weather_app/utils/constants/app_sizes.dart';
import 'package:weather_app/utils/constants/app_text_styles.dart';

class CityInfo extends StatelessWidget {
  final Color bgColor;
  final String imagePath;
  final String cityName;

  const CityInfo(
      {super.key,
      required this.bgColor,
      required this.imagePath,
      required this.cityName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
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
