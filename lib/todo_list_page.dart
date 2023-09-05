import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textEditingController = TextEditingController();

  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          TextField(
            controller: _textEditingController,
          ),
          SizedBox(
              height: 250,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tasks[index]),
                      onLongPress: () {
                        setState(() {
                          tasks.removeAt(index);
                        });
                      },
                    );
                  }))
        ]),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              if (_textEditingController.text.isNotEmpty) {
                setState(() {
                  tasks.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              setState(() {
                tasks = [];
              });
              _textEditingController.clear();
            },
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
