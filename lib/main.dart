import 'package:dixi_prectical/blocs/blocs.dart';
import 'package:dixi_prectical/database/database.dart';
import 'package:dixi_prectical/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter CRUD',
      home: BlocProvider(
        create: (context) => EntryBloc(DatabaseHelper())..add(LoadEntriesEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}
