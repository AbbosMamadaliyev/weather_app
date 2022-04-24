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

  final now = DateTime.now();
  String todayDate = '';
  List<String> nextDays = [];

  WeatherLoadedState(
      this.weatherEntity, this.forecastDailyEntity, this.imageUrlRepository) {
    _getNextDays();
  }

  void _getNextDays() {
    final formatDate = DateFormat('MMMM dd, yyyy').format(now);
    todayDate = formatDate;

    nextDays.clear();
    var month = DateFormat('MMM').format(now);
    var today = int.parse(DateFormat('dd').format(now));
    for (int i = 1; i < 6; i++) {
      today++;
      nextDays.add('${today.toString()}-$month');
    }
    print(nextDays);
  }

  @override
  List<Object> get props => [
        weatherEntity,
        forecastDailyEntity,
        imageUrlRepository,
      ];
}

class WeatherErrorState extends WeatherState {
  String message;

  WeatherErrorState(this.message);

  @override
  List<Object> get props => [message];
}
