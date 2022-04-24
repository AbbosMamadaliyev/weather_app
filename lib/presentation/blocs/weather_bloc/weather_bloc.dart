import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/repositories/forecast_daily_repository_impl.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/entities/forecast_daily_entity.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

import '../../../data/repositories/image_url_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepositoryImpl _weatherRepositoryImpl;
  final ForecastDailyRepositoryImpl _forecastDailyRepositoryImpl;
  final ImageUrlRepository _imageUrlRepository;

  final String _cityName = 'tashkent';

  WeatherBloc(
    this._weatherRepositoryImpl,
    this._forecastDailyRepositoryImpl,
    this._imageUrlRepository,
  ) : super(WeatherLoadingState()) {
    on<FetchWeatherEvent>((event, emit) async {
      try {
        WeatherEntity weatherEntity =
            await _weatherRepositoryImpl.getWeather(_cityName);

        ForecastDailyEntity forecastDailyEntity =
            await _forecastDailyRepositoryImpl.getForecastDaily(_cityName);

        emit(WeatherLoadedState(
            weatherEntity, forecastDailyEntity, _imageUrlRepository));
      } catch (e) {
        print('error: $e');
        emit(WeatherErrorState(e.toString()));
      }
    });

    on<SearchCityEvent>((event, emit) async {
      try {
        WeatherEntity weatherEntity =
            await _weatherRepositoryImpl.getWeather(event.query);

        ForecastDailyEntity forecastDailyEntity =
            await _forecastDailyRepositoryImpl.getForecastDaily(event.query);

        emit(WeatherLoadedState(
            weatherEntity, forecastDailyEntity, _imageUrlRepository));
      } catch (e) {
        print('error: $e');
        emit(WeatherErrorState(e.toString()));
      }
    });
  }
}
