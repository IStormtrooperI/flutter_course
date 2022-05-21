void main(List<String> arguments){

  num coffeePrice = 60;
  String message = "the Price of the Coffee is ${coffeePrice}";
  // print(message);
  // print(subtract(message: "hell0", a: 40,b: 50));
  // function();
  // print(quiz1());


}

void function() => print("hello");

int subtract({int a = 0, int b = 0, String message = "hello"}){
  print(a-b);
  print(message);
  return a-b;
}

String quiz1({String message = "alo ", String message2 = "dyadya"}){
  return message + message2;
}

