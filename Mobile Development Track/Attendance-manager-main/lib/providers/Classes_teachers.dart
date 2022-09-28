import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClassTeacher extends ChangeNotifier {
  List<String> _classes = ['Class'];
  String user_id;
  String token;

  ClassTeacher(this.user_id, this.token, _classes);

  Future<void> fetchData() async {
    final url = Uri.parse(
        "https://attendance-manager-b9d3f-default-rtdb.europe-west1.firebasedatabase.app/classTeacher.json?auth=$token");

    try {
      final response = await http.get(url);

      final data = json.decode(response.body) as Map<String, dynamic>;

      
      List<String> d = data[user_id].map<String>((classs){return classs.toString();}).toList() ;

      _classes = ['Class'];
      if(d != null)
        _classes = _classes + d;
      
      print(_classes);
      
      
    } catch (e) {
      throw e;
    }
    
  }

  List<String> get classes {
    print(_classes);
    return [..._classes];
  }
}
