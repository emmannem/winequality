import 'package:flutter/material.dart';
import 'package:heartdisease/models/wine_data.dart';
import 'package:heartdisease/services/api_service.dart';
import 'package:heartdisease/screens/train_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  double? _quality;

  // Variable para controlar si se muestra el formulario o el resultado
  bool _showForm = true;

  WineData _wineData = WineData(
    fixed_acidity: 0,
    volatile_acidity: 0,
    citric_acid: 0,
    residual_sugar: 0,
    chlorides: 0,
    free_sulfur_dioxide: 0,
    total_sulfur_dioxide: 0,
    density: 0,
    pH: 0,
    sulphates: 0,
    alcohol: 0,
  );

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        final quality = await _apiService.postWineData(_wineData);
        setState(() {
          _quality = quality.quality;
          _showForm = false; // Oculta el formulario
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al obtener el resultado'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wine Quality'),
        backgroundColor: Color(0xFF5e2129), // Cambiar color del AppBar
        elevation: 0, // Eliminar sombra del AppBar
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainScreen(),
                ),
              );
            },
            icon: Icon(Icons.train), // Icono para el botón
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Para que el formulario sea desplazable si es largo
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_showForm)
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Alinea el texto a la izquierda
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Acidez Fija',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _wineData.fixed_acidity =
                              double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Acidez Volátil',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _wineData.volatile_acidity =
                              double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Ácido Cítrico',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _wineData.citric_acid = double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Azúcar Residual',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _wineData.residual_sugar =
                              double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Cloruros',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _wineData.chlorides = double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Dióxido de azufre libre',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _wineData.free_sulfur_dioxide =
                              double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Dióxido de azufre total',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _wineData.total_sulfur_dioxide =
                              double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Densidad',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _wineData.density = double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'pH',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _wineData.pH = double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Sulfatos',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _wineData.sulphates = double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Alcohol',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _wineData.alcohol = double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 16), // Agregar espacio entre los campos

                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Calcular'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(
                              0xFF5e2129), // Cambiar color de fondo del botón
                        ),
                      ),
                    ],
                  ),
                ),
              if (!_showForm && _quality != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0), // Añadir espacio vertical
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Resultado: $_quality',
                          style: TextStyle(
                            fontSize:
                                24, // Aumentar el tamaño del texto del resultado
                          ),
                        ),
                        SizedBox(
                            height:
                                24), // Espacio entre el resultado y el botón
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _showForm =
                                  true; // Muestra el formulario nuevamente
                            });
                          },
                          child: Text('Volver al formulario'),
                          style: ElevatedButton.styleFrom(
                            primary: Color(
                                0xFF5e2129), // Cambiar color de fondo del botón
                          ),
                        ),
                      ],
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
