import 'package:flutter/material.dart';
import 'package:learn_controller_bloc/controller/task_bloc.dart';
import '../model/model_task.dart';
import 'colors_app.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({
    Key? key,
    required this.controllerTitle,
    required this.controllerDescription,
    required this.taskBloc,
    required this.cores,
  }) : super(key: key);

  final TextEditingController controllerTitle;
  final TextEditingController controllerDescription;
  final TaskBloc taskBloc;
  final Cor cores;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Adicionar tarefa',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                controller: controllerTitle,
                decoration: const InputDecoration(hintText: 'Título')),
            TextFormField(
              controller: controllerDescription,
              decoration: const InputDecoration(hintText: 'Descrição'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  taskBloc.adicionar(
                    Task(
                        descricao: controllerDescription.text,
                        title: controllerTitle.text),
                  );
                  controllerDescription.clear();
                  controllerTitle.clear();
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.save,
                ),
                style: ElevatedButton.styleFrom(
                  primary: cores.iconButtonColor,
                ))
          ],
        ),
      ),
    );
  }
}
