import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Models/TaskModel.dart';
import 'package:untitled/Widgets/CustomTextFormField.dart';
import 'package:untitled/Models/TaskModel.dart';
class ThirdScreen extends StatefulWidget{
  @override
   const ThirdScreen({super.key});
   State<ThirdScreen> createState()=>_ThirdScreen() ;
}
class _ThirdScreen extends State<ThirdScreen>
{
  TextEditingController taskcontroller=TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState>formkey=GlobalKey<FormState>();
Widget build(BuildContext Context)
{
  return Padding(padding: EdgeInsetsGeometry.all(16), child:Scaffold(key:formkey,resizeToAvoidBottomInset: true,appBar:AppBar(
    title: Text('New Task',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize:20 ,
        color:Colors.black  ),),
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ) ,
    body:SingleChildScrollView(child:
  Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [CustomTextFormField(Controller: taskcontroller,
        hint:'Task Name' , title:'Task Name', maxlines: 1,validator:(value) {
        if (value!.isEmpty) {
          return "There is no written task";
        }
        return null;
      }, ),
        SizedBox(height:20),
      CustomTextFormField(Controller: descriptionController,
      hint:'Finish onboarding UI and hand off to devs by Thursday.',
      title:'Task Description',
      validator:(value) {
    if (value!.isEmpty) {
      return "There is no written task";
    }
    return null;
  },
  maxlines: 5),
        SizedBox(height: 20),
       /* Row(mainAxisAlignment:MainAxisAlignment.start,children: [
          Text('High Priority',style: GoogleFonts.poppins(fontSize:20,color: Colors.black,fontWeight: FontWeight.w500),)
        ],),*/
     ElevatedButton(onPressed:()async{

       if(formkey.currentState!.validate())
         {
         final prefs = await SharedPreferences.getInstance();
         final model = TaskModel(
           task: taskcontroller.text,
           desc: descriptionController.text,
         );
           String? Old = prefs.getString("tasks");
           List<dynamic>taskslist=[];
           if(Old!=null&&Old.isNotEmpty)
             {
             final Decoded= jsonDecode(Old);
             taskslist=Decoded;
             }
           Map<String, dynamic> newTask = model.toMap();
       taskslist.add(newTask);
       await prefs.setString("tasks", jsonEncode(taskslist));
       print(taskslist);
         Navigator.pop(context);
     }},
         style: ElevatedButton.styleFrom(
           backgroundColor: Color(0xff15B86C),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadiusGeometry.circular(100),
           ),
           fixedSize: Size(MediaQuery.of(context).size.width, 40),
         ),
       child: Text(
         "Add a Task",
         style: GoogleFonts.poppins(
           fontSize: 14,
           fontWeight: FontWeight.w500,
           color: Color(0xffFFFFFF),
         ),
       ),
     ),

      ],

      )
  )));
}
}