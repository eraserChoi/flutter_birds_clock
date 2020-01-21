import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class ClockEvent extends Equatable {
  ClockEvent([List props = const []]) : super(props);
}

class PageLoaded extends ClockEvent {
  @override
  String toString() => 'PageLoaded';
}

class AddBtnPressed extends ClockEvent {
  @override
  String toString() => 'Add Button Pressed { addBtnPressed : true}';
}

class SettingBtnPressed extends ClockEvent {
  @override
  String toString() => 'Setting Button Pressed { seetingBtnPressed : true}';
}

class FacilityBtnPressed extends ClockEvent {
  final int selectedFacilityIndex;

  FacilityBtnPressed({@required this.selectedFacilityIndex})
      : super([selectedFacilityIndex]);
  @override
  String toString() {
    return 'Facility Button Pressed : { FacilityBtnPressed : true, index: $selectedFacilityIndex';
  }
}

class BackgroundImgPressed extends ClockEvent {
  final String backgroundImg;
  BackgroundImgPressed({@required this.backgroundImg}) : super([backgroundImg]);

  @override
  String toString() => 'Setting Button Pressed { BackgroundImgPressed : true}';
}

class FacilitySettingPressed extends ClockEvent {
  final int selectedFacilityIndex;

  FacilitySettingPressed({@required this.selectedFacilityIndex})
      : super([selectedFacilityIndex]);

  @override
  String toString() =>
      'Facility Setting Button Pressed { facilitySettingPressed : true, Index is $selectedFacilityIndex';
}

class BackGroundImageChanged extends ClockEvent {
  final String bgImage;
  final int bgIndex;

  BackGroundImageChanged({@required this.bgImage, @required this.bgIndex});
}

class DataAnalysisBtnPressed extends ClockEvent {
  @override
  String toString() =>
      'DataAnalysis Button Pressed { dataAnalysisBtnPressed : true }';
}
