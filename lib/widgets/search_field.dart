import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/screens/city_info_screen.dart';
import 'package:weather_app/utils/constants/app_color.dart';
import 'package:weather_app/utils/constants/app_sizes.dart';

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
                  decoration:
                      const InputDecoration(labelText: 'Search Weather'),
                ),
              ),
            ),
          ),
          const SizedBox(width: 7),
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
                  icon: const Icon(Icons.search),
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
