import 'package:flutter/material.dart';

class ListPage extends StatefulWidget{

  String? valor;
  ListPage(this.valor);

  @override
  _ListPageState createState() => _ListPageState();

}

class _ListPageState extends State<ListPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar(){
    return AppBar(
      title: Text('Bem vindo, ${widget.valor}'),
      backgroundColor: Colors.blue,
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