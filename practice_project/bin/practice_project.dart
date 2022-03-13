//
// abstract class Add{
//   double a = 0  , b = 0 ;
//   double add();
// }
// abstract class Subtract{
//   double a = 0 , b = 0 ;
//   double sub();
// }
// abstract class Multiply{
//   double a = 0 , b = 0 ;
//   double multiply();
// }
// abstract class Divide{
//   double a = 0 , b = 0 ;
//   double divide();
// }
//
// class Arithmatic implements Add, Subtract, Multiply, Divide {
//   double a , b ;
//
//   Arithmatic(this.a, this.b);
//
//   @override
//   double add() {
//     return a + b ;
//   }
//
//   @override
//   double sub() {
//     return a - b ;
//   }
//
//   @override
//   double multiply() {
//     return a * b ;
//   }
//
//   @override
//   double divide() {
//     return a / b ;
//   }
// }
//
//
// void main(List<String> arguments) {
//   final myMaths = Arithmatic(20, 5);
//   print("Addition is : ${myMaths.add()}");
//   print("Subtraction is : ${myMaths.sub()}");
//   print("Multiplication is : ${myMaths.multiply()}");
//   print("Division is : ${myMaths.divide()}");
// }

// abstract class Widget {}
//
// class Image extends Widget {
//   Image({required this.url});
//
//   String url;
//
//   @override
//   String toString() => url;
// }
//
// class Text extends Widget {
//   Text({required this.text});
//
//   String text;
//
//   @override
//   toString() => text;
// }
//
// class Button extends Widget {
//   Button({required this.id, required this.child, required this.onPress});
//
//   final id;
//   final Widget child;
//   final void Function() onPress;
// }
//
// void printMessage() => print("This is click event");
//
// void main() {
//   final saveButn =
//   Button(
//       id: "Btn-1",
//       child: Image(url: "WWW.google.com"),
//       onPress: printMessage
//   );
//
//   print(saveButn.child.toString());
//   saveButn.onPress();
//
//   final cancelButn =
//   Button(
//       id: "Btn-2",
//       child: Text(text: "Cancel Button"),
//       onPress: printMessage
//   );
//
//   print(cancelButn.child.toString());
//   cancelButn.onPress();
//
// }

// abstract class Person {
//   Person({required this.name});
//
//   String name;
//   void getDetails();
//
//   factory Person.fromType({required typeNAme, required name, salary, fee}) {
//     if (typeNAme.toString().toLowerCase() == "trainer" && salary != null)
//       return Trainer(name: name, salary: salary);
//     else if(typeNAme.toString().toLowerCase() == "student" && fee != null)
//       return Student(name: name, fee: fee);
//
//       throw UnimplementedError(
//           "Invalid Type Name or either salary or fee property value is missing for relavant class");
//
//   }
// }
//
// class Trainer extends Person{
//   Trainer({required name, required this.salary}) : super(name: name);
//
//   int salary;
//
//
//   @override
//   void getDetails () => print("Trainer name : $name ,salary : $salary");
// }
//
// class Student extends Person {
//   Student({required name, required this.fee}) : super(name: name);
//
//   int fee;
//
//
//   @override
//   void getDetails() => print("Student name : $name, Fee : $fee");
// }
//
// void main(){
//   Person trainerA = Person.fromType(typeNAme: "trainer", name: "Amir",salary: 5000);
//   Person studentA = Person.fromType(typeNAme: "Student", name: "Ali",fee: 500);
//
//   trainerA.getDetails();
//   studentA.getDetails();
//   print(trainerA);
//   print(studentA);
//
// }



abstract class Person{
  Person({required this.name});

  String name;

  void getDetails();

  factory Person.fromJson({required Map<String,Object> json}){
    final salary = json["salary"];
    final type = json["type"].toString().toLowerCase();
    final fee = json["fee"];
    final name = json["name"];

 final obj;
    switch(type){
      case "trainer":
      if(salary != null){
        obj = Trainer(name : name, salary : salary as int);
        break;
      }
      throw UnimplementedError("Salary is not provided");
     case "student":
      if (fee != null ){
        obj =  Student(name : name, fee : fee as int );
        break ;
      }
      throw UnimplementedError("Fee is not Provided");
      default : throw UnimplementedError("Invalid Type");
    }
  return obj;
  }
}

class Trainer extends Person{
  Trainer({required name , required this.salary}) : super(name: name);
  int salary;


  @override
  void getDetails() => print("Trainer name : $name, Trainer Salary : $salary");

}

class Student extends Person{
  Student({required name , required this.fee}) : super(name: name);
  int fee;


  @override
  void getDetails() => print("Student name : $name, Student fee : $fee");

}

void main(){
  final trainer = Person.fromJson(json: {"name" : "Amir", "salary" : 1000, "type" : "Trainer"});
  final student = Person.fromJson(json: {"name" : "Adnan", "fee" : 500, "type" : "Student"});

  trainer.getDetails();
  student.getDetails();

  // final unknownType = Person.fromJson(json: {'name':'ali','fee':500,'type':'Director'});
}