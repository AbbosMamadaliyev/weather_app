class WeatherEntity {
  String base;
  Clouds clouds;
  int cod;
  Coord coord;
  int dt;
  int id;
  Main main;
  String name;
  Sys sys;
  int timezone;
  int visibility;
  List<Weather> weather;
  Wind wind;

  WeatherEntity({
    required this.base,
    required this.clouds,
    required this.cod,
    required this.coord,
    required this.dt,
    required this.id,
    required this.main,
    required this.name,
    required this.sys,
    required this.timezone,
    required this.visibility,
    required this.weather,
    required this.wind,
  });

  factory WeatherEntity.fromJson(Map<String, dynamic> json) {
    return WeatherEntity(
      base: json['base'],
      cod: json['cod'],
      coord: Coord.fromJson(json['coord']),
      dt: json['dt'],
      id: json['id'],
      main: Main.fromJson(json['main']),
      name: json['name'],
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      clouds: Clouds.fromJson(json['clouds']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Coord {
  double lat;
  double lon;

  Coord({required this.lat, required this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'] is int
          ? double.parse(json['lat'].toString())
          : json['lat'],
      lon: json['lon'] is int
          ? double.parse(json['lon'].toString())
          : json['lon'],
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
      feels_like: json['feels_like'],
      humidity: json['humidity'],
      pressure: json['pressure'],
      temp: json['temp'],
      temp_max: json['temp_max'],
      temp_min: json['temp_min'],
    );
  }
}

class Sys {
  String country;
  int? id;
  int sunrise;
  int sunset;
  int? type;

  Sys(
      {required this.country,
      required this.id,
      required this.sunrise,
      required this.sunset,
      required this.type});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      country: json['country'],
      id: json['id'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      type: json['type'],
    );
  }
}

class Clouds {
  int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
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
