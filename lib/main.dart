import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repositories/forecast_daily_repository_impl.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/presentation/blocs/weather_bloc/weather_bloc.dart';

import 'app/my_app.dart';
import 'data/repositories/image_url_repository.dart';

void main() {
  runApp(
    BlocProvider(
      create: (BuildContext context) => WeatherBloc(
        WeatherRepositoryImpl(),
        ForecastDailyRepositoryImpl(),
        ImageUrlRepository(),
      ),
      child: const MyApp(),
    ),
  );
}
