import 'package:meta/meta.dart';

@immutable
class ClockState {
  final bool isDarkMode;
  final String weather;
  final bool backgroundWeather;
  final bool isTimeChanged;
  final bool is24TimeFormat;



  ClockState({
    @required this.isDarkMode,
    @required this.weather,
    @required this.backgroundWeather,
    @required this.isTimeChanged,
    @required this.is24TimeFormat,
  });

  factory ClockState.empty() {
    return ClockState(
        isDarkMode: false,
        weather: "sunny",
        backgroundWeather: false,
        isTimeChanged: false,
        is24TimeFormat: false,
    );
  }

  ClockState update(
      {bool isDarkMode,
        String weather,
        bool backgroundWeather,
        bool isTimeChanged,
        bool is24TimeFormat,
        }) {
    return copyWith(
      isDarkMode: isDarkMode,
      weather: weather,
      backgroundWeather: backgroundWeather,
      isTimeChanged: isTimeChanged,
      is24TimeFormat: is24TimeFormat,
    );
  }

  ClockState copyWith(
      {bool isDarkMode,
        String weather,
        bool backgroundWeather,
        bool isTimeChanged,
        bool is24TimeFormat,
        }) {
    return ClockState(
      isDarkMode: isDarkMode ?? false,
      weather: weather ?? "",
      backgroundWeather: backgroundWeather ?? false,
      isTimeChanged: isTimeChanged ?? false,
      is24TimeFormat: is24TimeFormat ?? false,
    );
  }

  @override
  String toString() {
    return ''' 
      ClockState{
      isDarkMode : $isDarkMode,
      weather : $weather,
      backgroundWeather: $backgroundWeather,
      isTimeChanged: $isTimeChanged,
      is24TimeFormat: $is24TimeFormat,
    ''';
  }
}
