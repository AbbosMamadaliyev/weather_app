class ForecastDailyEntity {
  List<ListForecast> list;

  ForecastDailyEntity({required this.list});

  factory ForecastDailyEntity.fromJson(Map<String, dynamic> json) {
    return ForecastDailyEntity(
      list: (json['list'] as List<dynamic>)
          .map((e) => ListForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListForecast {
  Main main;
  Wind wind;
  int visibility;
  String dt_txt;
  Sys sys;

  List<Weather> weather;

  ListForecast(
      {required this.main,
      required this.wind,
      required this.visibility,
      required this.dt_txt,
      required this.sys,
      required this.weather});

  factory ListForecast.fromJson(Map<String, dynamic> json) {
    return ListForecast(
      dt_txt: json['dt_txt'],
      main: Main.fromJson(json['main']),
      sys: Sys.fromJson(json['sys']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Sys {
  String pod;

  Sys({required this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'],
    );
  }
}

class Wind {
  int deg;
  double speed;

  Wind({required this.deg, required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      deg: json['deg'],
      speed: json['speed'] is int
          ? double.parse(json['speed'].toString())
          : json['speed'],
    );
  }
}

class Main {
  double feels_like;
  int humidity;
  int pressure;
  double temp;
  double temp_max;
  double temp_min;

  Main({
    required this.feels_like,
    required this.humidity,
    required this.pressure,
    required this.temp,
    required this.temp_max,
    required this.temp_min,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      feels_like: json['feels_like'] is int
          ? double.parse(json['feels_like'].toString())
          : json['feels_like'],
      humidity: json['humidity'],
      pressure: json['pressure'],
      temp: json['temp'] is int
          ? double.parse(json['temp'].toString())
          : json['temp'],
      temp_max: json['temp_max'] is int
          ? double.parse(json['temp_max'].toString())
          : json['temp_max'],
      temp_min: json['temp_min'] is int
          ? double.parse(json['temp_min'].toString())
          : json['temp_min'],
    );
  }
}

class Weather {
  String description;
  String icon;
  int id;
  String main;

  Weather(
      {required this.description,
      required this.icon,
      required this.id,
      required this.main});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['description'],
      icon: json['icon'],
      id: json['id'],
      main: json['main'],
    );
  }
}
