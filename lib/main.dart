import 'package:BlocSample/bottom_sheet/bottom_sheet.dart';
import 'package:BlocSample/cubit/sample_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fab/fab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider<SampleCubit>(
        create: (context) => SampleCubit(),
        child: MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Sample'),
      ),
      floatingActionButton: Fab(),
      bottomSheet: PersistentBottomSheet(),
      body: Container(),
    );
  }
}
