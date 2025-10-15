import 'package:flutter/material.dart';
import 'package:navegacao_direta/register_page.dart';

class Loginpage extends StatelessWidget{

  const Loginpage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: body(context),
    );
  }

  Center body(BuildContext context){
    return Center(
      child: Container(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            TextField(
              decoration: InputDecoration(labelText: 'E-mail', border: OutlineInputBorder()),
              style: TextStyle(color: Colors.amber, fontSize: 30),
            ),
            const SizedBox(height: 20,),

            TextField(
              decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
              style: TextStyle(color: Colors.amber, fontSize: 30),
            ),
            const SizedBox(height: 20,),

            Container(
              width: 100,
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(60, 50),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                child: Text('Enter', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20,),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('New here ?', style: TextStyle(color: Colors.black),),
                  SizedBox(width: 5,),
                  //Text('Create an account', style: TextStyle(color: Colors.blue))
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterPage())
                      );
                    },
                    child: Text('Create an account')
                  )

                ],

              )
            )

          ],
        ),
      ),
    );
  }

}