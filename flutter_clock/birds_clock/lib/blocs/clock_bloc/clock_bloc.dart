import 'dart:async';
import 'package:digital_clock/blocs/clock_bloc/bloc.dart';
import 'package:bloc/bloc.dart';

class ClockBloc extends Bloc<ClockEvent, ClockState> {
  @override
  ClockState get initialState => ClockState.empty();

  @override
  Stream<ClockState> mapEventToState(ClockEvent event) async* {
    if (event is PageLoaded) {
      yield* _mapPageLoadedToState();
    } else if (event is AddBtnPressed) {
      yield* _mapAddBtnPressedToState();
    }

//    else if (event is ModifyFacilityNmCompletePressed) {
//      yield* _mapModifyFacilityNmPressedToState(event.name, event.fid);
//    }
  }

//  Stream<ClockState> _mapBackgroundImgPressedToState(
//      String backgroundImg) async* {
//    yield state.update(
//      backgroundImg: backgroundImg,
//    );
//  }

  Stream<ClockState> _mapPageLoadedToState() async* {
    //yield state.update(facilityList: _facilityList, userName: userName);
  }

  Stream<ClockState> _mapAddBtnPressedToState() async* {
//    yield state.update(
//      addBtnPressed: true,
//      settingBtnPressed: false,
//      dataAnalysisBtnPressed: false,
//      facilityBtnPressed: false,
//      facilitySettingPressed: false,
//    );
  }


//
//  Stream<ClockState> _mapFacilityBtnPressedToState(int index) async* {
//    UserUtil.setFacility(state.facilityList[index].fid,
//        state.facilityList[index].name);
//
//    yield state.update(
//        addBtnPressed: false,
//        settingBtnPressed: false,
//        dataAnalysisBtnPressed: false,
//        facilityBtnPressed: true,
//        facilitySettingPressed: false,
//        selectedFacilityIndex: index);
//  }
}