// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../models/switch_menu.dart';

part 'switch_menu_event.dart';
part 'switch_menu_state.dart';

class SwitchMenuBloc extends Bloc<SwitchMenuEvent, SwitchMenuState> {
  SwitchMenuBloc() : super(const SwitchMenuState()) {
    on<SwitchMenuEventChange>((event, emit) {
      emit(state.copyWith(selectedIndex: event.payload.selectedIndex));
    });
  }
}
