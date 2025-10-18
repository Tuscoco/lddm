import 'package:flutter/material.dart';

class ListPage extends StatefulWidget{

  ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();

}

class _ListPageState extends State<ListPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: body(),
    );
  }

  Center body(){
    return Center(
      child: ListView.builder(
        itemCount: 20,

        itemBuilder: (context, index) {
          
          return ListTile(
            onTap: (){
              showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text('Item $index'),
                    content: Text('Esse é o item ${index} ele é muito legal'),
                  );
                }
              );
            },
            title: Text('Item $index'),
            subtitle: Text('Venha conhecer o item ${index}'),
          );

        }
      ),
    );
  }

}