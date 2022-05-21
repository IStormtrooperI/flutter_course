
import '../ToDo.dart';

abstract class ApiStates {

}

class LoadingState extends ApiStates{

}

class FailureState extends ApiStates{

}

class InitialState extends ApiStates{

}

class SuccessTodoList extends ApiStates{
  List<ToDo> Todo;

  SuccessTodoList(this.Todo);
}