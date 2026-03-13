import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/ThirdScreen.dart';
import 'package:untitled/Widgets/CustomTextFormField.dart';
import 'dart:convert';
import 'package:untitled/Models/TaskModel.dart';

class secondscreen extends StatefulWidget {
  const secondscreen({super.key});


  @override
  State<secondscreen> createState() => _secondscreen();

}

class _secondscreen extends State<secondscreen> {
  String? name = "Guest";
  List<TaskModel> tasksList = [];


  @override
  void initState() {
    super.initState();
    loadName();
    loadTask();
  }

  loadName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    name = sharedPreferences.getString("name") ?? "Guest";
    setState(() {});
  }
  loadTask()async{
    final prefs = await SharedPreferences.getInstance();
    final tasks = prefs.getString("tasks");

    if (tasks != null) {
      final decoded = jsonDecode(tasks);

      final taskList = List.from(
        decoded,
      ).map((e) => TaskModel.fromJson(e)).toList();

      setState(() {
        tasksList = taskList;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset:true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/images/Yasmina.jpeg"),
            ),
            const SizedBox(width:8),
            Text(
              "Good Evening, $name",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            )]),

            const SizedBox(height:20),

            Text(
              "One task at a time. One step closer.",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: Colors.black54,
              ),

            ),
           SizedBox(height: 20),
            Text("""Yuhuu ,Your work Is
                     almost done ! 👋 """,style: GoogleFonts.plusJakartaSans(color: Colors.black,fontSize: 32,
                fontWeight: FontWeight.w400)),
          SizedBox(height:40),
          Row(mainAxisAlignment: MainAxisAlignment.start,children: [
          Expanded(
              child: tasksList.isEmpty
                  ? Center(
                child: Text(
                  "No Tasks Yet\nClick Add Task",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              )
                  : ListView.builder(
                  itemCount: tasksList.length,
                  itemBuilder: (context, index) {
                    final task = tasksList[index];

                    return Container(
                        margin: const EdgeInsets.only(bottom: 16),

                        decoration: BoxDecoration(
                          color: const Color(0xff1E293B),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),

                        child: ListTile(
                            leading: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xff15B86C,
                                ).withOpacity(.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Color(0xff15B86C),
                              ),
                            ),

                            title: Text(
                              task.task,
                              style: GoogleFonts.poppins(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            subtitle: Text(
                              task.desc,
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),),
                    );
                  },
              ))]),
   SizedBox(height:40),
          FloatingActionButton.extended(
              elevation: 8,
              onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdScreen()),
              ).then((_) => loadTask());
              },
            backgroundColor:Color( 0xff15B86C),
            icon: Icon(Icons.add,color: Colors.white),
            label: Text("Add New Task",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
         )]
      ))
      ),
    );
  }
}
