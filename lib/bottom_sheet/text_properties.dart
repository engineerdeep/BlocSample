import 'package:BlocSample/cubit/models/text_mode.dart';
import 'package:BlocSample/cubit/sample_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextProperties extends StatelessWidget {
  final kSelectedColor = Colors.blue;
  final kDeselectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final sampleCubit = BlocProvider.of<SampleCubit>(context);
    void editSomeText() {
      final textMode = sampleCubit.state.selectedMode as TextMode;
      final updatedTextMode = textMode.copyWith(TextProperty.editText);
      sampleCubit.updatedProperty(updatedTextMode);
      print("Edit mode activated, user can start editing their text");
    }

    return BlocListener<SampleCubit, SampleState>(
      listener: (context, state) {
        // After uncommenting code from fab.dart, new [selectedProperty] is not captured here.

        final textMode = state.selectedMode as TextMode;
        print('In BlocListener ${textMode.selectedProperty}');
      },
      child: SizedBox(
        height: 50.0,
        child: BlocBuilder<SampleCubit, SampleState>(
          builder: (context, state) {
            final textMode = state.selectedMode as TextMode;
            return Row(
              children: [
                FlatButton(
                  onPressed: editSomeText,
                  child: Text(
                    'EditText',
                    style: TextStyle(
                        color:
                            textMode.selectedProperty == TextProperty.editText
                                ? kSelectedColor
                                : kDeselectedColor),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
