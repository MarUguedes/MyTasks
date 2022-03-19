import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_controller_bloc/view/colors_app.dart';
import '../controller/task_bloc.dart';
import 'widget_excluir_bottom_sheet.dart';

class CardTask extends StatelessWidget {
  final String title;
  final String subtitle;
  final String data;
  final cores = Cor();
  void Function() onRemove;

  CardTask(
      {Key? key,
      required this.onRemove,
      required this.title,
      required this.subtitle,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>();
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Card(
        color: cores.taskColor,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: cores.appBarTextColor),
                      )),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return ExcluirBottomSheet(
                                cores: cores,
                                taskBloc: taskBloc,
                                onRemove: onRemove,
                              );
                            });
                      },
                      icon: Icon(
                        Icons.close,
                        color: cores.closeIconColor,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: cores.subtitleColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 20,
                      color: cores.closeIconColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      data,
                      style: TextStyle(color: cores.dateColor, fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
