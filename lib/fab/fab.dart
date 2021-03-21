import 'package:BlocSample/cubit/models/image_mode.dart';
import 'package:BlocSample/cubit/models/text_mode.dart';
import 'package:BlocSample/cubit/sample_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Fab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sampleCubit = BlocProvider.of<SampleCubit>(context);
    void onSelectText() {
      sampleCubit.updatedProperty(
          TextMode()); // This will start the TextMode with selectedProperty as none by default.

      // Uncomment below to attempt to start edit mode as soon as bottomsheet is opened. It works but the function [editSomeText] is not called.
      // final textMode = sampleCubit.state.selectedMode as TextMode;
      // final updatedTextMode = textMode.copyWith(TextProperty.editText);
      // sampleCubit.updatedProperty(updatedTextMode);

      Navigator.pop(context);
    }

    void onSelectPhotos() {
      sampleCubit.updatedProperty(ImageMode());
      Navigator.pop(context);
    }

    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.grey[900],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (context) {
              return SizedBox(
                height: 300,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.text_format,
                            size: 28,
                            color: Colors.white,
                          ),
                          onPressed: onSelectText,
                        ),
                        const Text(
                          'Text',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.image_outlined,
                              size: 28, color: Colors.white),
                          onPressed: onSelectPhotos,
                        ),
                        const Text(
                          'Photos',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            });
      },
      child: Icon(Icons.add),
    );
  }
}
