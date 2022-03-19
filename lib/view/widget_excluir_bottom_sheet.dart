import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_controller_bloc/controller/task_bloc.dart';
import 'package:learn_controller_bloc/model/model_task.dart';
import 'colors_app.dart';

class ExcluirBottomSheet extends StatelessWidget {
  ExcluirBottomSheet(
      {Key? key,
      required this.cores,
      required this.taskBloc,
      required this.onRemove})
      : super(key: key);

  final Cor cores;
  VoidCallback onRemove;
  TaskBloc taskBloc;

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Deseja excluir a tarefa ?',
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      onRemove();
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.library_add_check),
                    style: ElevatedButton.styleFrom(
                      primary: cores.iconAceptedColor,
                    )),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.cancel_presentation,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: cores.iconButtonColor,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
