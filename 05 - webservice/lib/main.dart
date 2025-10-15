import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Chamada API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controller = TextEditingController();
  String _resultado = "";
  String _nome = "";
  String _id = "";
  String _height = "";
  String _weight = "";

  void chamarApi() async {
    final entrada = _controller.text;
    http.Response response;

    try {
      final url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$entrada");
      response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          _nome = data["name"];
          _id = data["id"].toString();
          _height = (data["height"] / 10).toString();
          _weight = (data["weight"] / 10).toString();
          _resultado = "Nome: ${_nome} \n ID: ${_id} \n Altura: ${_height}m \n Peso: ${_weight}kg";
        });
      } else {
        setState(() {
          response = "Erro: ${response.statusCode}" as http.Response;
        });
      }
    } catch (e) {
      setState(() {
        response = "Erro na requisição: $e" as http.Response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Digite o nome do Pokémon",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: chamarApi,
              child: const Text("Chamar API"),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
