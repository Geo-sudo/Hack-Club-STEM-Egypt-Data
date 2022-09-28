// ignore_for_file: prefer_collection_literals, deprecated_member_use

import 'package:attendancee/colors.dart';
import 'package:attendancee/providers/Sessions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  bool init = false;
  List<Session> sessions = [];

  @override
  void didChangeDependencies() async {
    if (!init) {
      await Provider.of<Sessions>(context, listen: false).FetchData();
      sessions = await Provider.of<Sessions>(context, listen: false).sessions;
      print(sessions);

      setState(() {
        init = true;
      });
    }
    super.didChangeDependencies();
  }

  Widget showList() {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: sessions.length,
        itemBuilder: (BuildContext context, int index) {
          return rowItem(context, index);
        });
  }

  Widget rowItem(context, index) {
    return Dismissible(
      key: Key(sessions[index].id),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: Text("Are you sure?"),
                content: Text("Do you want to remove this session?"),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text("No")),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        Provider.of<Sessions>(context, listen: false).deleteSession(sessions[index].id);
                      },
                      child: Text("Yes"))
                ],
              );
            });
      },
      background: deleteBgItem(),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('Edit-session', arguments: {"id": sessions[index].id});
        },
        child: Card(
          child: ListTile(
            title: Text(sessions[index].class_),
            trailing: Text(
              DateFormat.yMMMMEEEEd().format(sessions[index].date),
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

  showSnackBar(context, session, index) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
            '${session.class_} - ${DateFormat.yMMMMEEEEd().format(session.date)} deleted'),
        action: SnackBarAction(
            label: 'Undo deleted session.',
            onPressed: () {
              undoDelete(index, session);
            }),
      ),
    );
  }

  undoDelete(index, session) {
    setState(() {
      sessions.insert(index, session);
    });
  }

  removeSession(index) {
    setState(() {
      sessions.removeAt(index);
    });
  }

  Widget deleteBgItem() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: SizedBox(
                  child: Text(
                    'Review & Edit sessions',
                    textAlign: TextAlign.justify,
                    textScaleFactor: 2,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.80,
                child: showList(),
              ),
            ]),
      ),
    );
  }
}
