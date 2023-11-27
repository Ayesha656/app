import 'package:app/loader1.dart';
import 'package:flutter/material.dart';



class fscreen extends StatefulWidget {
  const fscreen({super.key});

  @override
  State<fscreen> createState() => _fscreenState();
}

class _fscreenState extends State<fscreen> {


  void initState() {
    super.initState();

    // Delay for 2 seconds and then navigate to the next screen
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loader1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFFFFFF),

      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          SizedBox(
            height: 350,
          ),
      Center(
        child: Container(
          width: 400,
        child: Image.asset("images/stylisglogo.png",width: 400,)
        ),



      ),

    ]
      )
    );
  }
}
