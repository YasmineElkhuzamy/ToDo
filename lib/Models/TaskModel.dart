class TaskModel
{
  String task;
  String desc;
  TaskModel({required this.task, required this.desc});
  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      TaskModel(task: json["name"], desc: json["desc"]);
  toMap() {
    return {"name": task, "desc": desc};
  }

}