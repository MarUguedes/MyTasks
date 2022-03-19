import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_controller_bloc/controller/task_bloc.dart';
import 'package:learn_controller_bloc/model/model_task.dart';
import 'package:learn_controller_bloc/view/widget_add_task.dart';
import 'package:learn_controller_bloc/view/widget_cardTask.dart';
import 'colors_app.dart';
import 'package:badges/badges.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTask extends StatefulWidget {
  const HomeTask({Key? key}) : super(key: key);

  @override
  State<HomeTask> createState() => _HomeTaskState();
}

class _HomeTaskState extends State<HomeTask> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  final cores = Cor();

  @override
  void dispose() {
    controllerDescription.dispose();
    controllerTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>(); // para acessar os metodos

    return Scaffold(
      backgroundColor: cores.backgroungColor,
      body: Column(children: [
        AppBar(
          title: BlocBuilder<TaskBloc, List<Task>>(
            builder: (context, state) {
              return Badge(
                padding: const EdgeInsets.all(4),
                position: BadgePosition.topEnd(),
                badgeColor: cores.iconButtonColor,
                badgeContent: Text(
                  '${state.length}',
                  style: TextStyle(
                      color: cores.backgroungColor,
                      fontWeight: FontWeight.bold),
                ),
                child: Text(
                  'My Tasks',
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                        color: cores.appBarTextColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
          backgroundColor: cores.appBarColor,
        ),
        Expanded(
          child: BlocBuilder<TaskBloc, List<Task>>(
            builder: ((context, state) {
              return ListView.builder(
                  itemCount: state
                      .length, // o state se torna a lista entao acessa os atributos por ele
                  itemBuilder: (context, index) {
                    return CardTask(
                      onRemove: () {
                        taskBloc.remover(index);
                      },
                      title: taskBloc.state[index].title,
                      subtitle: taskBloc.state[index].descricao,
                      data: taskBloc.state[index].convertedDateTime,
                    );
                  });
            }),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: cores.iconButtonColor,
        child: const Icon(
          Icons.add,
          size: 38,
        ),
        onPressed: (() {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) {
                return AddTaskBottomSheet(
                    controllerTitle: controllerTitle,
                    controllerDescription: controllerDescription,
                    taskBloc: taskBloc,
                    cores: cores);
              });
        }),
      ),
    );
  }
}
