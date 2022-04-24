part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState {
  WeatherEntity weatherEntity;
  ForecastDailyEntity forecastDailyEntity;
  ImageUrlRepository imageUrlRepository;

  WeatherLoadedState(
      this.weatherEntity, this.forecastDailyEntity, this.imageUrlRepository);

  @override
  List<Object> get props => [weatherEntity, forecastDailyEntity];
}

class WeatherErrorState extends WeatherState {
  String message;

  WeatherErrorState(this.message);

  @override
  List<Object> get props => [message];
}
