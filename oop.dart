class Person {
  String firstName;
  String lastName;
  String id;
  DateTime dob;

  Person(
    this.firstName,
    this.lastName,
    this.id,
    this.dob,
  );
}

class Student extends Person {
  String dept;
  String course;

  Student(String firstName, String lastName, this.dept, this.course, int yob,
      int mob, String id)
      : super(firstName, lastName, id, DateTime(yob, mob)) {}
}
