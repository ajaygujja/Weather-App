part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetWeather extends WeatherEvent {
  GetWeather({@required this.cityName});
  final String? cityName;

  @override
  List<Object?> get props => [cityName];
}


class ResetWeather extends WeatherEvent {}
