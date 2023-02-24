import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/utils/constants/app_sizes.dart';
import 'package:weather_app/utils/constants/app_string.dart';
import 'package:weather_app/utils/constants/app_text_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.searchwhite,
        borderRadius: BorderRadius.circular(AppSizes.searchPromtRadius),
      ),
      child: SizedBox(
        height: AppSizes.searchPromtHeight,
        width: AppSizes.searchPromtWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 0, horizontal: AppSizes.searchPromtPadding),
          child: TextField(
            decoration: InputDecoration(
                hintText: AppStrings.searchPrompt,
                hintStyle: AppTextStyles.searchPromptText,
                enabledBorder: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
