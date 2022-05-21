import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../ToDo.dart';
import 'api_events.dart';
import 'api_states.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  ApiBloc() : super(InitialState()) {
    on<GetToDoEvent>(_getToDoEvent);
  }

  _getToDoEvent(GetToDoEvent event, Emitter<ApiStates> emitter) async {
    try {
      emitter(LoadingState());
      List<ToDo> ToDoList = await getToDo();
      emitter(SuccessTodoList(ToDoList));
    }catch(e){
      print(e);
      emitter(FailureState());
    }
  }

  Future<List<ToDo>> getToDo() async {
    List<ToDo> ToDoList = [];
    print("connecting to API");
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body) as List;
      list.forEach((element) {
        ToDo toDo = ToDo.fromJson(element);
        ToDoList.add(toDo);
      });
      return ToDoList;
    } else {
      print('Error ${response.reasonPhrase}');
    }
    return [];
  }
}