part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}

class SearchCityEvent extends WeatherEvent {
  final String query;

  const SearchCityEvent(this.query);

  @override
  List<Object?> get props => [query];
}
