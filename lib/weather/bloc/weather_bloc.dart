import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:weather_app/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield WeatherLoading();

    if (event is GetWeather) {
      try {
        final weather = await _fetchWeatherFromApi(event.cityName!);

        yield WeatherLoaded(weather);
      } catch (e) {
        yield WeatherError();
        print("exception $e");
      }

    } else if (event is ResetWeather) {
      yield WeatherInitial();
    }
  }

  Future<Weather> _fetchWeatherFromApi(String cityName) async {
    final result = await http.Client().get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=502957057d382f27f866a4089160e301'));

    if (result.statusCode != 200) {
      throw Exception();
    } else {
      print(result.body);
      return parsedJson(result.body);
    }
  }

  Weather parsedJson(final String response) {
    final dynamic jsonDecoded = json.decode(response);

    final dynamic jsonWeather = jsonDecoded["main"];

    return Weather.fromJson(jsonWeather as Map<String, dynamic>);
  }
}
