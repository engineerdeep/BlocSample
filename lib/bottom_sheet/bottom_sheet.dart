import 'package:BlocSample/bottom_sheet/photos_properties.dart';
import 'package:BlocSample/bottom_sheet/text_properties.dart';
import 'package:BlocSample/cubit/models/image_mode.dart';
import 'package:BlocSample/cubit/models/initial_mode.dart';
import 'package:BlocSample/cubit/models/text_mode.dart';
import 'package:BlocSample/cubit/sample_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersistentBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SampleCubit, SampleState>(
      builder: (context, state) {
        if (state.selectedMode is InitialMode) {
          return SizedBox(
            height: 0.0,
            width: 0.0,
          );
        } else if (state.selectedMode is ImageMode) {
          return PhotosProperties();
        } else if (state.selectedMode is TextMode) {
          return TextProperties();
        } else {
          return SizedBox(
            width: 0.0,
            height: 0.0,
          );
        }
      },
    );
  }
}
