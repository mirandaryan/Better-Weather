class Coord
{
  final double lon;
  final double lat;

  Coord(
  { required this.lon,
    required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json)
  {
    return Coord(
      lon: json["lon"],
      lat: json["lat"]);
  }
}

class Weather
{
  final String main;
  final String icon;

  Weather(
  { required this.main,
    required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json)
  {
    return Weather(
      main: json["main"],
      icon: json["icon"]);
  }
}

class Main
{
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Main(
      { required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.humidity});

  factory Main.fromJson(Map<String, dynamic> json)
  {
    return Main(
      temp: json["temp"],
      feelsLike: json["feels_like"],
      tempMin: json["temp_min"],
      tempMax: json["temp_max"],
      pressure: json["pressure"],
      humidity: json["humidity"]);
  }
}

class Wind
{
  final String speed;

  Wind(
      {required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json)
  {
    return Wind(
        speed: json["speed"]);
  }
}

class Rain
{
  final double rainfall;

  Rain(
      {required this.rainfall});

  factory Rain.fromJson(Map<String, dynamic> json)
  {
    return Rain(
    rainfall: json["1h"]);
  }
}

class Clouds
{
  final double all;

  Clouds(
      {required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json)
  {
    return Clouds(
        all: json["all"]);
  }
}

class DataResponse
{
  final String name;
  final Coord coord;
  final Weather weather;
  final Main main;
  final Wind wind;
  final Rain rain;
  final Clouds clouds;

  String get iconUrl
  {
    return 'https://openweathermap.org/img/wn/${weather.icon}@2x.png';
  }

  DataResponse(
      { required this.name,
        required this.coord,
        required this.weather,
        required this.main,
        required this.wind,
        required this.rain,
        required this.clouds});

  factory DataResponse.fromJson(Map<String, dynamic> json)
  {
    final name = json["name"];

    final coordJson = json["coord"];
    final coord = Coord.fromJson(coordJson);

    final weatherJson = json["weather"];
    final weather = Weather.fromJson(weatherJson);

    final mainJson = json["main"];
    final main = Main.fromJson(mainJson);

    final windJson = json["wind"];
    final wind = Wind.fromJson(windJson);

    final rainJson = json["rain"];
    final rain = Rain.fromJson(rainJson);

    final cloudsJson = json["clouds"];
    final clouds = Clouds.fromJson(cloudsJson);

    return DataResponse(name: name, coord: coord, weather: weather, main: main, wind: wind, rain: rain, clouds: clouds);
  }
}