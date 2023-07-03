part of 'switch_menu_bloc.dart';

abstract class SwitchMenuEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SwitchMenuEventChange extends SwitchMenuEvent {
  final SwitchMenu payload;
  SwitchMenuEventChange(this.payload);
}
