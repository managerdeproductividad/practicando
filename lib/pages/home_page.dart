import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicando/main.dart';
import 'package:practicando/widgets/my_drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  int age = 0;

  Future<void> save() async {
    SharedPreferences mandarina = await SharedPreferences.getInstance();
    mandarina.setString("name", "Daniel MOntes");
    mandarina.setInt("age", 30);
    print("GUardando...");
  }

  Future<void> getData() async {
    SharedPreferences mantequilla = await SharedPreferences.getInstance();
    print(mantequilla.getString("name"));
    name = mantequilla.getString("name") ?? "-";
    age = mantequilla.getInt("age") ?? 0;
    setState(() {});
  }

  Future<String> getName() async {
    SharedPreferences matasquita = await SharedPreferences.getInstance();
    return matasquita.getString("name") ?? "-";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shared Preferences"),
      ),
      drawer: MyDrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                save();
              },
              child: Text(
                "Guardar",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                getData();
              },
              child: Text(
                "Obtener",
              ),
            ),
            Text(
              name,
            ),
            FutureBuilder(
              future: getName(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  return Text(snap.data);
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
