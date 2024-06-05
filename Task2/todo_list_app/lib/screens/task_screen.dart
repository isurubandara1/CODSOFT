import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_data.dart';
import '../providers/theme_provider.dart';
import '../widgets/task_list.dart';
import 'edit_task_screen.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Task Manager',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  'Task Manager',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share App'),
              onTap: () {
                // Navigate to the home screen
              },
            ),
            ListTile(
              leading: Icon(Icons.get_app),
              title: Text('More Apps'),
              onTap: () {
                // Navigate to the settings screen
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Rate App'),
              onTap: () {
                // Navigate to the about screen
              },
            ),
            ListTile(
                title: Image.asset(
              'assets/images/draw.png',
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            )),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: TaskList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextField(
                          onChanged: (newText) {
                            newTaskTitle = newText;
                          },
                          decoration: InputDecoration(
                            labelText: 'New Task',
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (newTaskTitle.isNotEmpty) {
                              Provider.of<TaskData>(context, listen: false)
                                  .addTask(newTaskTitle);
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'Add Task',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            elevation: 5,
                          ),
                        ),
                      ],
                    ),
                  ));
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}