import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_course/Lectures/models/User.dart';
import 'api_events.dart';
import 'api_states.dart';

class ApiBLoc extends Bloc<ApiEvents, ApiStates> {
  ApiBLoc() : super(InitialState()) {
    on<GetUserListEvent>(_getUserList);
  }

  _getUserList(GetUserListEvent event, Emitter<ApiStates> emitter) async {
    //get users list
    try {
      emitter(LoadingState());
      List<User> users = await getUsers();
      emitter(SuccessUserList(users));
    }catch(e){
      print(e);
      emitter(FailureState());
    }
  }

  Future<List<User>> getUsers() async {
    List<User> usersList = [];
    // print("connecting to API");
    Uri url = Uri.parse('https://gorest.co.in/public/v2/users');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body) as List;
      list.forEach((element) {
        User user = User.fromJson(element);
        usersList.add(user);
      });
      // print(usersList);
      return usersList;
    } else {
      print('Error ${response.reasonPhrase}');
    }
    return [];
  }
}