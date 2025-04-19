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
  final String key;
  final String activity;
  final TaskCategory type;
  final int participants;
  final double price;
  final String link;
  final double accessibility;
  bool done;

  Task({
    required this.key,
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.accessibility,
    this.done = false
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      key: json["key"],
      activity: json["activity"],
      type: TaskCategory.values.firstWhere(
        (category) => category.name.toString() == json["type"],
      ),
      participants: json["participants"],
      price: json["price"].toDouble(),
      link: json["link"],
      accessibility: json["accessibility"].toDouble(),
      done: json["done"]
    );
  }
}
