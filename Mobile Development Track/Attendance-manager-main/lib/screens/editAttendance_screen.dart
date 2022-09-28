import 'package:attendancee/colors.dart';
import 'package:attendancee/providers/Sessions.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class editScreen extends StatefulWidget {
  @override
  State<editScreen> createState() => _editScreenState();
}

class _editScreenState extends State<editScreen> {
  bool init = false;

  @override
  void didChangeDependencies() async {
    if (!init) {
      await Provider.of<Sessions>(context, listen: false).FetchData();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context){
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final id = arguments["id"] as String;

    Session s =  Provider.of<Sessions>(context)
        .sessions
        .firstWhere((session) => session.id == id);

    String _class = s.class_;
    Map<String, bool> _students = s.students as Map<String, bool>;
    DateTime _date = s.date;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: kWhite,
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Color.fromARGB(150, 0, 230, 173),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Class: ${_class}",
                                style: TextStyle(
                                    color: kWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(DateFormat.yMMMEd().format(_date),
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ]),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.03,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04),
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            String key = _students.keys.elementAt(index);
                            return Column(
                              children: [
                                Row(children: [
                                  Expanded(child: Text(key)),
                                  IconButton(
                                      onPressed: ()async{
                                        await Provider.of<Sessions>(context, listen: false).checkAttendance(id, key);
                                      },
                                      icon: _students[key]
                                          ? Icon(Icons.check_box)
                                          : Icon(Icons.check_box_outline_blank))
                                ]),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black54,
                                )
                              ],
                            );
                          },
                          itemCount: _students.length,
                        ))
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}

 // String _class = "10D";
    // DateTime _date = DateTime(2022, 9, 14);
    // Map<String, bool> _students = {
    //   "Adham Emam Ali Taha": false,
    //   "Ahmed Gamal Abdelmenam Khair Allah": true,
    //   "Ahmed Hany Mohamed AbdelHady": false,
    //   "Paula Alphons Hakim Abdelsamea": true,
    //   "Hazem Mohamed Ghobashy Elsayed Ibrahim": false,
    //   "David Elks Kam Shehata Eissa": false,
    //   "Zyad Ahmed Mahmoud Abdelaleam": true,
    //   "Seif Eldin Hatem Mahmoud Abdelmaksood": false,
    //   "Abdelrahman Mohamed Abdelghafar Mahmoud": false,
    //   "Abdallah Ezzat Abdallah Elsrsy": true,
    //   "Abdallah Yasser Fawzy Thabet": false,
    //   "Mazen Mamdouh Ayoub Abdelgaid": true,
    //   "Mohamed Seif Eldin Rezq": true,
    //   "Mohamed Omar Ibrahim Mahmoud": true,
    //   "Kevin Atef Elia Gabra": false,
    //   "Omar Ahmed Abdelfatah Negm": true,
    //   "Youssef Ahmed Abdelfatah Negm": false,
    //   "Mohamed Hatem Abdelwahed Eshry Salam": true,
    //   "Ahmed Mahmoud Abdelaziz Ahmed": false,
    //   "Mohamed Ashraf Abdelfatah Abdelazim": false,
    // };

