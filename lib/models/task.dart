enum TaskCategory {
  random("Random"),
  education("Education"),
  recreational("Recreational"),
  social("Social"),
  diy("DIY"),
  charity("Charity"),
  cooking("Cooking"),
  relaxation("Relaxation"),
  music("Music"),
  busywork("Hardwork");

  const TaskCategory(this.titleDisplay);

  final String titleDisplay;
}

class Task {
  final String id;
  final String activity;
  final TaskCategory type;

  Task({
    required this.id,
    required this.activity,
    required this.type,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["id"],
      activity: json["activity"],
      type: TaskCategory.values.firstWhere(
        (category) => category.name.toString() == json["type"],
      ),
    );
  }

  factory Task.fromFireBaseJson(String id, Map<String, dynamic> json) {
    return Task(
      id: id,
      activity: json["activity"],
      type: TaskCategory.values.firstWhere(
            (category) => category.name.toString() == json["type"],
      ),
    );
  }
}


class CreateTask{
  final String activity;
  final TaskCategory type;

  CreateTask({
    required this.activity,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {'activity': activity, 'type': type.name.toString()};
  }
}
