part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetWeather extends WeatherEvent {
  final String? cityName;

  GetWeather({@required this.cityName});

  @override
  List<Object?> get props => [cityName];
}

class ResetWeather extends WeatherEvent {}
