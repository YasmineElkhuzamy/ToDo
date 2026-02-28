import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Containers/CustomContainer.dart';
import 'package:untitled/ThirdScreen.dart';
import 'ThirdScreen.dart';

class secondscreen extends StatefulWidget {
  const secondscreen({super.key});

  @override
  State<secondscreen> createState() => _secondscreen();
}

class _secondscreen extends State<secondscreen> {
  String? name = "Guest";
  late bool isDone=true;

  @override
  void initState() {
    super.initState();
    loadName();
  }

  loadName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    name = sharedPreferences.getString("name") ?? "Guest";
    setState(() {});
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
          TaskItem(title:'Finish video in flutter Courses', subtitle:'',isDone: true ),
            TaskItem(title:'Finish video in flutter Courses', subtitle:'', isDone: true ),
            TaskItem(title:'Finish video in flutter Courses', subtitle:'', isDone: true ),
         /* InkWell(
            onTap:onTapdetails,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black26),
              ),
              child: const Icon(Icons.arrow_outward, size: 18),

            ))*/SizedBox(height: 400),
            Row(mainAxisAlignment: MainAxisAlignment.end,children: [
          FloatingActionButton.extended(
            onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThirdScreen()),
          );},
            backgroundColor:Color( 0xff15B86C),
            icon: Icon(Icons.add,color: Colors.white),
            label: Text("Add New Task",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
         )] )])
      )),
    );
  }
}
