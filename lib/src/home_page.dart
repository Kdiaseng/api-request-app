import 'package:app_request_api/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.start();
  }

  _succes() {
    return ListView.builder(
        itemCount: homeController.todos.length,
        itemBuilder: (context, index) {
          var todo = homeController.todos[index];
          return ListTile(
            leading: Checkbox(
              onChanged: (value) {},
              value: todo.completed,
            ),
            title: Text(todo.title),
          );
        });
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          homeController.start();
        },
        child: Text('Tentar novamente'),
      ),
    );
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _succes();

        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  homeController.start();
                })
          ],
          title: Text('List Todo\s'),
        ),
        body: AnimatedBuilder(
          animation: homeController.state,
          builder: (context, child) {
            return stateManagement(homeController.state.value);
          },
        ));
  }
}
