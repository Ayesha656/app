import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loader3 extends StatefulWidget {
  const loader3({super.key});

  @override
  State<loader3> createState() => _loader3State();
}

class _loader3State extends State<loader3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Color(0xFFFFFFFF),

        body: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Row(


                  children: [Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => loader3()));
                            },
                            child: Container(
                              child: Text("3/3", style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),

                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => loader3()));
                            },
                            child: Container(
                              child: Text("Skip", style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),

                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                  ]
              ),
              SizedBox(
                height: 150,
              ),
              Center(
                child: Container(
                    width: 400,
                    child: Image.asset("images/img3.png",width: 400,)
                ),
              ),
              Center(
                child: Text("Choose Product", style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 38,
                  fontWeight: FontWeight.w700,

                ),),
              ),
              Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: Text("Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.", style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                    ),),
                  ),
                ),
              ),


            ]
        )
    );
  }
}
