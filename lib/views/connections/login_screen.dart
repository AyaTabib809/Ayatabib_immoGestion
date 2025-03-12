import 'package:flutter/material.dart';
import '../../services/utilisateur.service.dart';
import '../../models/utilisateur.model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  final UtilisateurService _utilisateurService = UtilisateurService();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        Utilisateur utilisateur = await _utilisateurService.login(
          _emailController.text,
          _passwordController.text,
        );

        if (utilisateur.statut == "valider") {
          // Rediriger en fonction du rôle
          switch (utilisateur.role) {
            case "client":
              Navigator.pushReplacementNamed(context, '/client_dashboard');
              break;
            case "technicien":
              Navigator.pushReplacementNamed(context, '/technicien_dashboard');
              break;
            case "administrateur":
              Navigator.pushReplacementNamed(context, '/admin_dashboard');
              break;
            default:
              setState(() {
                _errorMessage = "Rôle inconnu.";
              });
          }
        } else {
          setState(() {
            _errorMessage = "Votre compte est en statut '${utilisateur.statut}'.";
          });
        }
      } catch (e) {
        setState(() {
          _errorMessage = "Email ou mot de passe incorrect.";
        });
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Connexion")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer votre email";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Mot de passe"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer votre mot de passe";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              _errorMessage != null
                  ? Text(_errorMessage!, style: TextStyle(color: Colors.red))
                  : SizedBox(),
              SizedBox(height: 16.0),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: Text("Se connecter"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
