import 'package:flutter/cupertino.dart';

class Session {
  String id;
  DateTime date;
  String class_;
  Map<String, bool> students;

  Session(
      {@required this.id,
      @required this.date,
      @required this.class_,
      @required this.students});
}

List<Session> sessions = [
  Session(id: "1", date: DateTime(2022,1,1), class_: "10A", students: {}),
  Session(id: "2", date: DateTime(2022,3,4), class_: "10B", students: {}),
  Session(id: "3", date: DateTime(2022,5,6), class_: "10A", students: {}),
  Session(id: "4", date: DateTime(2022,7,8), class_: "10C", students: {}),
  Session(id: "5", date: DateTime(2022,9,10), class_: "10D", students: {}),
  Session(id: "6", date: DateTime(2022,11,12), class_: "10F", students: {}),
  Session(id: "7", date: DateTime(2022,9,12), class_: "10H", students: {}),
  Session(id: "8", date: DateTime(2021,8,5), class_: "11A", students: {}),
  Session(id: "9", date: DateTime(2022,4,2), class_: "10A", students: {}),
  Session(id: "10", date: DateTime(2022,11,8), class_: "10A", students: {}),
];