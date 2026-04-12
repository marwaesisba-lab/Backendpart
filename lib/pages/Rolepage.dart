import 'package:flutter/material.dart';

class Role extends StatelessWidget {
  const Role({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color(0xFFF4ECDD),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 123),
            Container(
              width: 200,
                height: 80,
                alignment: Alignment.center,
              child:Text(
                'WELCOME!',
                style: TextStyle(fontWeight: FontWeight.w700,fontSize: 32,fontFamily: 'Inter'),

              ) ,

            ),
            //SizedBox(height: 20),
            Container(
              //width: 305,
              height: 67,
              alignment: Alignment.center,
              child:Text(
                'choose your role:',
                style: TextStyle(fontWeight: FontWeight.w700,fontSize: 32,fontFamily: 'Inter'),

              ),
            ),
            Container(
              width: 361,
                height: 141,
                decoration: BoxDecoration(
                  color: Color(0xFFF4ECDD),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              alignment: Alignment.center,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
              Text(
                'Find a Service',
                style:TextStyle(fontFamily: 'Inter',fontSize: 24,fontWeight: FontWeight.w700),
              ),
                 Text(
                   '(Customer)',
                   style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Inter',fontSize: 24),
                 ),
              ],
            ),
            ),
            SizedBox(height: 30),
            Container(
              width: 361,
              height: 141,
              decoration: BoxDecoration(
                color: Color(0XFFF4ECDD),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              alignment: Alignment.center,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                'Offer Services',
                style:TextStyle(fontFamily: 'Inter',fontSize: 24,fontWeight: FontWeight.w700),
              ),
              Text(
                '(Professional)',
                style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Inter',fontSize: 24),
              ),
              ],
            ),

      ),
          ],
        ),
      ),


    );
  }
}