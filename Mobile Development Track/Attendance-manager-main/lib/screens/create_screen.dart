import 'package:attendancee/providers/Auth.dart';
import 'package:attendancee/providers/Classes_teachers.dart';
import 'package:attendancee/providers/Sessions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:attendancee/colors.dart';
import 'package:intl/intl.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  bool init = false;
  String _selectedClass = 'Class';
  DateTime _selectedDate = null;
  String _msg = "";

  @override
  void didChangeDependencies() async {
    if (!init) {
      try {
        await Provider.of<ClassTeacher>(context, listen:false).fetchData();
        print("ol");
      } catch (e) {
        print(e);
      }
      setState(() {
        init = true;
      });
    }
    super.didChangeDependencies();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2011, 1, 1),
            lastDate: DateTime(2030, 1, 1))
        .then((picked) {
      if (picked == null) {
        return;
      } else {
        setState(() => _selectedDate = picked);
      }
    });
  }

  void _createSession() async{
    if (_selectedDate == null || _selectedClass == 'Class') {
      print("Couldn't A");
      setState(() {
        _msg = "Class and/or Date isn't selected";
      });
      return;
    } else {
      try {
        final id = await Provider.of<Sessions>(context, listen:false)
            .createSession(_selectedDate, _selectedClass);
          Navigator.of(context).pushNamed("Edit-session", arguments:{"id": id});
      } catch (e) {
        print(e);
        setState(() {
          _msg = "Couldn't create session";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: kBackgroundColor,
            centerTitle: true,
            elevation: 0,
          
          ),
      body: Center(
        child: SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create",
                          style: TextStyle(
                              fontSize: 56,
                              color: kWhite,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("Session",
                            style: TextStyle(
                                fontSize: 56,
                                color: kWhite,
                                fontWeight: FontWeight.bold)),
                      ],
                    )),
                    Column(
                      children: [
                        Text(_msg,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 36.sp,
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xFFD9D9D9),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: DropdownButtonFormField<String>(
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                style: TextStyle(
                                    color: Color(0xFF837272),
                                    fontWeight: FontWeight.bold),
                                value: _selectedClass,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                items: Provider.of<ClassTeacher>(context)
                                    .classes
                                    .map<DropdownMenuItem<String>>((classs) {
                                  return DropdownMenuItem<String>(
                                    value: classs,
                                    child: Text(classs),
                                  );
                                }).toList(),
                                onChanged: (picked) {
                                  setState(() {
                                    _selectedClass = picked;
                                  });
                                }),
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(
                              MediaQuery.of(context).size.height * 0.06),
                          primary: Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _selectedDate == null
                              ? Text("Date",
                                  style: TextStyle(color: Color(0xFF837272)))
                              : Text(DateFormat.yMMMEd().format(_selectedDate),
                                  style: TextStyle(color: Color(0xFF837272))),
                          Icon(
                            Icons.date_range,
                            color: Colors.black,
                            size: 30,
                          )
                        ],
                      ),
                      onPressed: () {
                        _showDatePicker();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(
                              MediaQuery.of(context).size.height * 0.06),
                          primary: kLightGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Text("Create"),
                      onPressed: () {
                        _createSession();
                      },
                    ),
                    
                  ],
                ))),
      ),
    );
  }
}
