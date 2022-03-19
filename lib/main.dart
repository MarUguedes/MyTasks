import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_controller_bloc/controller/task_bloc.dart';
import 'package:learn_controller_bloc/view/home_task.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return TaskBloc();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeTask(),
      ),
    ),
  );
}
