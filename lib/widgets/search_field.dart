import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/screens/city_info_screen.dart';
import 'package:weather_app/screens/test_screen.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/utils/constants/app_sizes.dart';
import 'package:weather_app/utils/constants/app_string.dart';
import 'package:weather_app/utils/constants/app_text_styles.dart';
import 'package:weather_app/utils/constants/cached_data.dart';

class SearchField extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();

  SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = Provider.of<WeatherBloc>(context);

    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
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
                child: TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(labelText: 'Search Weather'),
                ),
              ),
            ),
          ),
          SizedBox(width: 7),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.searchwhite,
              borderRadius: BorderRadius.circular(AppSizes.searchPromtRadius),
            ),
            child: SizedBox(
              height: AppSizes.searchPromtHeight,
              width: AppSizes.searchPromtHeight,
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _weatherBloc.add(GetWeather(city: _cityController.text));
                      Navigator.pushNamed(context, CityInfoScreen.routeName);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
