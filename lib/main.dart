import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/login_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/screens/city_info_screen.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/login_screen.dart';
import 'package:weather_app/screens/test_screen.dart';
import 'package:weather_app/screens/cached_data_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        BlocProvider<WeatherBloc>(
            create: (BuildContext context) => WeatherBloc()),
      ],
      child: MaterialApp(
        title: 'Concentration',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: LoginScreen.routeName,
        routes: {
          TestScreen.routeName: (context) => TestScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          CityInfoScreen.routeName: (context) => CityInfoScreen(),
          CachedDataScreen.routeName: (context) => CachedDataScreen(),
        },
      ),
    );
  }
}
