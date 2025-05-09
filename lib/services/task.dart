import 'package:slave_app/helpers/request.dart';
import 'package:slave_app/models/task.dart';


const String baseUri = "https://slave-app-88692-default-rtdb.europe-west1.firebasedatabase.app/";


Future<List<Task>> getTasks() async {
  final url = "${baseUri}tasks.json";
  final Map<String, dynamic>? tasksMap = await request(url);
  final List<Task> tasks = [];
  if (tasksMap != null) {
    tasksMap.forEach((key, value) => tasks.add(Task.fromFireBaseJson(key, value)));
    return tasks;
  }
  return tasks;
}

Future<void> saveTask(CreateTask newTask) async {
  final url = "${baseUri}tasks.json";
  final taskMap = newTask.toJson();
  await request(url, method: 'POST', body: taskMap);
}

Future<void> removeTask(String id) async {
  final url = '${baseUri}tasks/$id.json';
  await request(url, method: 'DELETE');
}
