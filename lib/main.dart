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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CONSULTAS HTTP',
      home: PokemonScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PokemonScreen extends StatefulWidget{
  @override
  _PokemonScreenState createState() => _PokemonScreenState(); 
}

class _PokemonScreenState extends State<PokemonScreen>{
  String nombre = "";
  String imgUrl = "";
  bool cargando =true;
  
  @override
  void initState() {
    super.initState();
    obtenerPokemon();
    
  }
  
  Future<void> obtenerPokemon() async{
    final respuesta = 
        await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/pikachu"));

    if (respuesta.statusCode == 200){
      final datos = jsonDecode(respuesta.body);
      setState(() {
        nombre = datos["name"];
        imgUrl = datos["sprites"]["front_default"];
        cargando = false;
      });
    }else{
      throw Exception("Error al cargar");
    }
  } 

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text("Act LDSW -3.6. Peticiones HTTP"),
  ),
  body: Stack(
  children: [
  Container(
  decoration: BoxDecoration(
  image: DecorationImage(image: AssetImage("lib/338492-PADRNY-313.jpg"),
  fit: BoxFit.cover,
  ),
  ),
  ),

  Center(
  child: cargando 
    ? CircularProgressIndicator()
      : Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text(nombre.toUpperCase(), style: TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,),
  ),
  SizedBox(height: 10),
  Image.network(imgUrl,  width: 200,
    height: 200,
    fit: BoxFit.contain,)
  ],
  ),
  ),


  ],
  ),
  );
  }


}
