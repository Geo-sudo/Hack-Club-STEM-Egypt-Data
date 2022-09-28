import 'package:attendancee/models/HttpException.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class Sessions with ChangeNotifier {
  List<Session> _sessions = [];
  String _token;
  String _userId;

  Sessions(this._token, this._userId, this._sessions);

  List<Session> get sessions {
    return [..._sessions];
  }

  Future<void> FetchData() async {
    final url = Uri.parse(
        "https://attendance-manager-b9d3f-default-rtdb.europe-west1.firebasedatabase.app/sessions/$_userId.json?auth=$_token");

    try {
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;

      List<Session> loadedSessions = [];

      print(_token);
      print(data);
      data.forEach((key, session){
        Map<String, bool> students = {};
        session["students"].forEach((key, value){
          students[key] = value; 
        });
        loadedSessions.insert(
          0,
          Session(
              id: key,
              class_: session["class"],
              date: DateTime.parse(session["date"]),
              students: students)
              
    );
    });

      _sessions = loadedSessions;
    } catch (e) {
      throw e;
    }
  }

  Future<String> createSession(DateTime date, String class_) async {
    final url = Uri.parse(
        "https://attendance-manager-b9d3f-default-rtdb.europe-west1.firebasedatabase.app/sessions/$_userId.json?auth=$_token");
    final url2 = Uri.parse(
        "https://attendance-manager-b9d3f-default-rtdb.europe-west1.firebasedatabase.app/classes.json?auth=$_token");

    try {
      final responseClass = await http.get(url2);
      final data = json.decode(responseClass.body);
    
      Map<String, bool> students = {};

      List<String> names = data[class_].map<String>((name){return name.toString();}).toList() ;
      
      for(int i = 0; i < names.length; i++)
      {
        print(names[i]);
        students[names[i].toString()] = false;
      }

      print(students);

      //data.forEach((key, value) => students[key] = false);

      final response = await http.post(url,
          body: json.encode({
            "class": class_,
            "date": date.toIso8601String(),
            "students": students
          }));

      _sessions.add(Session(
          id: json.decode(response.body)["name"],
          class_: class_,
          date: date,
          students: students));
      
      return json.decode(response.body)["name"];
    } catch (e) {
      throw e;
      
    }
    
    notifyListeners();
  }

  Future<void> checkAttendance(String sessionId, String studentId) async {
    final url = Uri.parse(
        "https://attendance-manager-b9d3f-default-rtdb.europe-west1.firebasedatabase.app/sessions/$_userId/$sessionId.json?auth=$_token");

    final editedSession = _sessions.firstWhere((session) => session.id == sessionId);
    editedSession.students[studentId] = !editedSession.students[studentId];

    try{
      final response = await http.patch(url, body: json.encode({
        "class": editedSession.class_,
        "date": editedSession.date.toIso8601String(),
        "students": editedSession.students
      }));

      if(response.statusCode >= 400)
      {
        HttpException(response.statusCode.toString());
      }

      final sessionsIndex = _sessions.indexWhere((session) => session.id == sessionId);
      _sessions[sessionsIndex] = editedSession;
      
    }
    catch(e)
    {
      throw e;
    }

    notifyListeners();
  }

  Future<void> deleteSession(String id) async {
    final url = Uri.parse(
        "https://attendance-manager-b9d3f-default-rtdb.europe-west1.firebasedatabase.app/sessions/$_userId/$id.json?auth=$_token");

    try {
      final response = await http.delete(url);

      if (response.statusCode >= 400) {
        throw HttpException(response.statusCode.toString());
      }

      _sessions.removeWhere((session) => session.id == id);
    } catch (e) {
      throw e;
    }
  }
}