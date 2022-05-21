import 'package:flutter_course/Lectures/models/User.dart';

abstract class ApiStates {

}

class LoadingState extends ApiStates{

}

class FailureState extends ApiStates{

}

class InitialState extends ApiStates{

}

class SuccessUserList extends ApiStates{
  List<User> users;

  SuccessUserList(this.users);
}