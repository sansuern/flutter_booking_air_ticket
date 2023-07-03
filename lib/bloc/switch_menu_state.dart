part of 'switch_menu_bloc.dart';

@immutable
class SwitchMenuState extends Equatable {
  final int selectedIndex;

  const SwitchMenuState({
    this.selectedIndex = 0,
  });

  SwitchMenuState copyWith({
    int? selectedIndex,
  }) {
    return SwitchMenuState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }

  List<Object?> get props => [selectedIndex];
}
