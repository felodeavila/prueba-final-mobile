import 'package:flutter/material.dart';

void main() {
  runApp(const SimulacroApp());
}

class SimulacroApp extends StatelessWidget {
  const SimulacroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExamenPage(),
    );
  }
}

class ExamenPage extends StatefulWidget {
  @override
  _ExamenPageState createState() => _ExamenPageState();
}

class _ExamenPageState extends State<ExamenPage> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _subtituloController = TextEditingController();

  List<Map<String, String>> items = [
    {'titulo': 'Tarea 1', 'subtitulo': 'horario'},
  ];
  void _agregar() {
    if (_tituloController.text.isNotEmpty) {
      setState(() {
        items.add({
          'titulo': _tituloController.text,
          'subtitulo': _subtituloController.text.isEmpty 
              ? 'Sin subtítulo' 
              : _subtituloController.text,
        });
        _tituloController.clear();
        _subtituloController.clear();
      });
    }
  }
  void _eliminar(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: 700,
          height: 450,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 20, spreadRadius: 5)
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _tituloController,
                        decoration: InputDecoration(
                          labelText: 'Tarea',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: _subtituloController,
                        decoration: InputDecoration(
                          labelText: 'Horario',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _agregar,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                          child: Text(
                            "Agregar Tarea",
                            style: TextStyle(
                              color: Colors.white, 
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(width: 1, color: Colors.grey[300]),

              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (c, i) => Divider(color: Colors.grey[300]),
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        title: Text(
                          items[index]['titulo']!,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
                        ),
                        subtitle: Text(
                          items[index]['subtitulo']!,
                          style: TextStyle(fontSize: 16, color: Colors.grey[600], fontStyle: FontStyle.italic),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline, color: Colors.black54),
                          onPressed: () => _eliminar(index),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
