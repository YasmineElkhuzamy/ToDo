import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/secondscreen.dart';
class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOne();
}

class _ScreenOne extends State<ScreenOne> {
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext Context)
  {
    TextEditingController controller;
    return SafeArea(child: Scaffold( resizeToAvoidBottomInset :true,backgroundColor: Colors.white,body:Expanded(child:SingleChildScrollView(child:  Column(children: [
      const SizedBox(height: 20),
    Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [CircleAvatar(radius: 21,backgroundColor: Colors.white,child:
      SvgPicture.asset("assets/images/Logo.svg")),const SizedBox(width: 16),Text("Tasky",
      style:GoogleFonts.plusJakartaSans(fontSize: 28,color: Colors.black,) ,)],
    ),
      const SizedBox(height: 127),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,children: [Text("Welcome to Tasky",
        style: GoogleFonts.plusJakartaSans(color: Colors.black,fontSize: 24)) ,const SizedBox(width:8)
        ,CircleAvatar(backgroundColor: Colors.white,
        radius: 14,child: SvgPicture.asset("assets/images/Hand.svg"))
    ]),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,children: [
            Text("",style: GoogleFonts.plusJakartaSans(color: Colors.black,fontSize: 28))
        ],
        ),
        const SizedBox(height:24 ),
      Image.asset("assets/images/pana.png"
      ,height:204.5 ,
      width: 215,),
      const SizedBox(height: 24),
      Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text('Full Name',style: GoogleFonts.plusJakartaSans(fontSize:16,color: Colors.black,fontWeight: FontWeight.w400)) ,
          const SizedBox(height: 8),
      Form( key: formKey,
          child:
      TextFormField(
     validator:(value) {
       if (value!.isEmpty) {
         return "Enter your name..";
       }
       else {
         return null;
       }
     },
       controller:nameController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16)
          ,borderSide: BorderSide(color:Color(0xff282828))),
            fillColor: Colors.white12,
          filled: true,
          hint:Text("Ex.Yasmine Elkhuzamy",style: TextStyle(color: Colors.black26,),),border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(16))
        ),

      )),
        SizedBox(height: 24),
          Center(child: ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final SharedPreferences prefs =
                await SharedPreferences.getInstance();
                prefs.setString("name", nameController.text.toString());
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => secondscreen()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff15B86C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(100),
              ),
              fixedSize: const Size(300, 40),
            ),
            child: Text(
              "Let’s Get Started",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xffFFFFFF),

              ),
            ),
          ))
      ],
        )]))))
    );
  }
}