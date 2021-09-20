import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(temperature: json['temp'] as double);
  }

  final double? temperature;

  @override
  List<Object?> get props => [temperature];

  double? get temp => temperature;
}
