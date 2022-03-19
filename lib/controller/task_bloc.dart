import 'package:learn_controller_bloc/model/model_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Cubit<List<Task>> {
  TaskBloc( ) : super([]);
  

  void adicionar(Task value) {
    state.add(value);
    emit([...state]);
  }

  void remover(int index) {
    state.removeAt(index);
    emit([...state]);
  }
}
