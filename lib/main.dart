import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List taskList = [
    {
      'title': 'Task 1',
      'time': '10:00 AM',
    },
    {
      'title': 'Task 2',
      'time': '11:00 AM',
    },
    {
      'title': 'Task 3',
      'time': '12:00 AM',
    },
    {
      'title': 'Task 4',
      'time': '01:00 PM',
    },
    {
      'title': 'Task 5',
      'time': '02:00 PM',
    },
    {
      'title': 'Task 6',
      'time': '03:00 PM',
    },
    {
      'title': 'Task 7',
      'time': '04:00 PM',
    },
    {
      'title': 'Task 8',
      'time': '05:00 PM',
    },
    {
      'title': 'Task 9',
      'time': '06:00 PM',
    },
    {
      'title': 'Task 10',
      'time': '07:00 PM',
    },
    {
      'title': 'Task 11',
      'time': '08:00 PM',
    },
    {
      'title': 'Task 12',
      'time': '09:00 PM',
    },
    {
      'title': 'Task 13',
      'time': '10:00 PM',
    },
    {
      'title': 'Task 14',
      'time': '11:00 PM',
    },
    {
      'title': 'Task 15',
      'time': '12:00 PM',
    },
  ];

  Widget taskCard(String title, String time) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(title),
            Text(time),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Task'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.emoji_people))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: taskList
              .map((task) => taskCard(task['title'], task['time']))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DateTime? date;
          TimeOfDay? time;
          String dateText = '日付が選択されていません';
          String timeText = '時間が選択されていません';

          showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(builder: ((context, setState) {
                  return SimpleDialog(
                  title: const Text('タスクを追加'),
                  children: [
                    Text('日付: $dateText'),
                    Text('時間: $timeText'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        setState(() {
                          if (date != null) {
                            dateText = '${date!.year}年${date!.month}月${date!.day}日';
                          }
                        });
                      },
                      child: const Text('日付を選択'),
                    ),
                  
                    ElevatedButton(
                      onPressed: () async {
                        time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        setState(() {
                          if (time != null) {
                            timeText = '${time!.hour}時${time!.minute}分';
                          }
                        });
                      },
                      child: const Text('時間を選択'),
                    ),
                  ],
                );
                }));
              });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Task'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Class'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Notice'),
        ],
      ),
    );
  }
}
