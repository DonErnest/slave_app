enum TaskCategory {
  education("Education"),
  recreational("Recreational"),
  social("Social"),
  diy("DIY"),
  charity("Charity"),
  cooking("Cooking"),
  relaxation("Relaxation"),
  music("Music"),
  busywork("Busywork");

  const TaskCategory(this.categoryDisplay);

  final String categoryDisplay;
}

class Task {
  final String key;
  final String activity;
  final TaskCategory type;
  final int participants;
  final int price;
  final String link;
  final double accessibility;

  const Task({
    required this.key,
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.accessibility,
  });
}
