import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/api_bloc.dart';
import '../bloc/api_events.dart';
import '../bloc/api_states.dart';
import '../../models/User.dart';

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
      home: BlocProvider(create: (_) => ApiBLoc(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person_add),
      ),
      body: buildBloc(),
    );
  }

  Widget buildBloc() {
    return BlocBuilder<ApiBLoc, ApiStates>(builder: (context, state) {
      if (state is InitialState) {
        return buildInitialView();
      }
      if (state is LoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is SuccessUserList) {
        List<User> users = state.users;
        return buildUserList(users);
      }
      if (state is FailureState) {
        return Center(child: Text("Error while connecting".toUpperCase()));
      }

      return Center(child: Text("Nothing"));
    });
  }

  Widget buildInitialView() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            context.read<ApiBLoc>().add(GetUserListEvent());
          },
          child: Text("Get Users".toUpperCase())),
    );
  }

  Widget buildUserList(List<User> users) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 5), () {});
      },
      child: RefreshIndicator(
        onRefresh: () {
          return Future.value(true);
        },
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text("${users[index].name}"),
                subtitle: Text("${users[index].email}"),
              );
            }),
      ),
    );
  }
}
