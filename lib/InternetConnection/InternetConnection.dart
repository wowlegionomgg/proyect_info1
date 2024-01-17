import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:proyectinfo/splash%20screen/SplashScreen.dart';
class InternetConnectionCheck extends StatefulWidget {
  @override
  _InternetConnectionCheckState createState() => _InternetConnectionCheckState();
}

class _InternetConnectionCheckState extends State<InternetConnectionCheck> {
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _isConnected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isConnected ? SplashScreen() : NoInternetConnectionScreen();
  }
}

class NoInternetConnectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'URL_DE_LA_IMAGEN',
              fit: BoxFit.contain, // Ajuste de la imagen dentro del contenedor
              width: MediaQuery.of(context).size.width * 0.8, // Ancho responsivo
              height: MediaQuery.of(context).size.height * 0.4, // Altura responsiva
            ),
            SizedBox(height: 20),
            Text(
              'No se puede conectar a Internet',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}