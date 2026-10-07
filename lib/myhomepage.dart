import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override 
  State<MyHomePage> createState() => _MyHomePageState();
}
  class _MyHomePageState extends State<MyHomePage> {
    TextEditingController _inputNama =  new TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("melunamusikplay"), 
          backgroundColor : Color.fromARGB(100, 248, 215, 215),),
     
        body: Column(
          children : [
            Center(
              child: Container(
                width: 300,
                color: Color.fromARGB(197, 220, 155, 155),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan Nama Kamu',
                    border: OutlineInputBorder(),
                  ),
                  controller: _inputNama,
                  onSubmitted: (values) {
                    _inputNama.text = values;
                  },

                ),
                ),
              ),
              ElevatedButton(
               child: Text("Tampilkan Nama Kamu"),
               onPressed: () {
                print(_inputNama.text);
               },
              ),
          ],
        ),
      );
        
      
    }
  }
