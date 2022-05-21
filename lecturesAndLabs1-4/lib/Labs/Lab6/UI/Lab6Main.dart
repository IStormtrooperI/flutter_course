import '../ToDo.dart';
import '../bloc/api_bloc.dart';
import '../bloc/api_events.dart';
import '../bloc/api_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.deepOrangeAccent)),
      home: BlocProvider(
        create: (_) => ApiBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ToDo> ToDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person_add),
      ),
      body: buildBloc(),
    );
  }

  Widget buildBloc() {
    return BlocBuilder<ApiBloc, ApiStates>(builder: (context, state) {
      if (state is InitialState) {
        return buildInitialView();
      }
      if (state is LoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is SuccessTodoList) {
        List<ToDo> todoes = state.Todo;
        return buildToDoList(todoes);
      }
      if (state is FailureState) {
        return Center(child: Text("Error while connecting".toUpperCase()));
      }

      return Text("Nothing");
    });
  }

  Center buildInitialView() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            context.read<ApiBloc>().add(GetToDoEvent());
          },
          child: Text("Get ToDo".toUpperCase())),
    );
  }

  Widget buildToDoList(List<ToDo> ToDoes) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 5), () {});
      },
      child: RefreshIndicator(
        onRefresh: () {
          return Future.value(true);
        },
        child: ListView.builder(
            itemCount: ToDoes.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.today_outlined),
                title: Text("${ToDoes[index].title}"),
                trailing: ToDoes[index].completed
                    ? Icon(
                  Icons.done,
                  color: Colors.green,
                )
                    : Icon(
                  Icons.remove_done,
                  color: Colors.red,
                ),
              );
            }),
      ),
    );
  }
}