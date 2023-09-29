class TaskItem {
  // Defining the characteristics of the list objects
  String task;
  bool completed;
  String? id;

  TaskItem(this.task, this.completed, [this.id]);

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(json['title'], json['done'], json['id']);
  }

  Map<String, dynamic> toJson() {
    return {"title": task, "done": completed};
  }
}
