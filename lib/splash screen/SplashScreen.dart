import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulación de carga
    Future.delayed(Duration(seconds: 2), () {
      // Navegar a la pantalla principal después de un tiempo de carga simulado
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Agregar la imagen de carga
            Image.asset(
              'assets/loading_image.gif',  // Ruta de la imagen en tus assets
              width: 200,  // Ancho de la imagen
              height: 200, // Altura de la imagen
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),  // Agregar el CircularProgressIndicator para simular la carga
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.home,
      'title': 'Inicio',
      'action': 'home',
      'route': '/'
    },
    {
      'icon': Icons.settings,
      'title': 'Ajustes',
      'action': 'settings',
      'route': '/settings'
    },
    {
      'icon': Icons.notifications,
      'title': 'Notificaciones',
      'action': 'notifications',
      'route': '/notifications'
    },
    {
      'icon': Icons.account_circle,
      'title': 'Iniciar sesión',
      'action': 'login',
      'route': '/login'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/user_avatar.jpg'),
            ),
          ),
          for (var item in menuItems)
            ListTile(
              leading: Icon(item['icon']),
              title: Text(item['title']),
              onTap: () {
                _handleAction(context, item['route']);
              },
            ),
        ],
      ),
    );
  }

  void _handleAction(BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Bienvenido a la página de inicio.', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Configura tus ajustes aquí.', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Tus notificaciones aparecerán aquí.', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Inicia sesión para acceder.', style: TextStyle(fontSize: 20)),
      ), // Cierre de la declaración body
    ); // Cierre de la declaración Scaffold
  }
}