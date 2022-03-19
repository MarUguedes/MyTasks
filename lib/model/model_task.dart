class Task {
  String title;
  String descricao;
  String convertedDateTime =
      "${DateTime.now().day}/0${DateTime.now().month}/${DateTime.now().year}";
  Task({required this.descricao, required this.title});
}
