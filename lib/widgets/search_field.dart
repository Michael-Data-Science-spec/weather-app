import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/utils/constants/app_sizes.dart';
import 'package:weather_app/utils/constants/app_string.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.searchwhite,
        borderRadius:
            BorderRadius.all(Radius.circular(AppSizes.searchPromtRadius)),
      ),
      child: SizedBox(
        height: AppSizes.searchPromtHeight,
        width: AppSizes.searchPromtWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 0, horizontal: AppSizes.searchPromtPadding),
          child: TextField(
            decoration: InputDecoration(
                hintText: AppStrings.searchPrompt,
                enabledBorder: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
