part of 'sample_cubit.dart';

class SampleState extends Equatable {
  const SampleState({this.selectedMode = const InitialMode()});

  final Mode selectedMode;

  @override
  List<Object> get props => [selectedMode];

  SampleState copyWith(Mode selectedMode) {
    return SampleState(
      selectedMode: selectedMode,
    );
  }
}
