import 'package:BlocSample/cubit/models/initial_mode.dart';
import 'package:BlocSample/cubit/models/mode.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sample_state.dart';

class SampleCubit extends Cubit<SampleState> {
  SampleCubit() : super(SampleState());

  void updatedProperty(Mode selectedMode) {
    emit(state.copyWith(selectedMode));
  }
}
