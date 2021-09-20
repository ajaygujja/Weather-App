part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState{}

class WeatherLoaded extends WeatherState {
  WeatherLoaded(this.weather);

  final Weather weather;

  @override
  List<Object?> get props => [weather];
}

