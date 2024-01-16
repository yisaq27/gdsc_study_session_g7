class TodoList {
  late String title;
  late String desc;
  late String dateTime;

  TodoList({required this.title, required this.desc, required this.dateTime});
  @override
  String toString() {
    return "$title \n$desc \n$dateTime";
  }
}

List<TodoList> todoLists = [
  TodoList(
      title: "UI/UX App design",
      desc:
          " First i have to animate the logo and prototyping my design. It's very important'First i have to animate the logo and prototyping my design It's very important First i have to animate the logo and prototyping my design. It's very important First i have to animate the logo and prototyping my design. It's very important",
      dateTime: "April 29, 2023"),
  TodoList(
      title: "View Candidats",
      desc: "View candidates and choose the potential one.",
      dateTime: "April 29, 2023"),
  TodoList(
      title: "Football Cup Drybling",
      desc: "Playing Football on Tereza court",
      dateTime: "April 29, 2023"),
];
