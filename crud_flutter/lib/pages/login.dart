import 'package:flutter/material.dart';
import 'package:crud_flutter/shared/style.dart';
import 'cadastro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 54, 69, 79),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 18, 18),
        flexibleSpace: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        
        children: [
          
          Positioned.fill(
            
            child: Center(
              
              child: Container(
                // height: MediaQuery.of(context).size.height * 1,
                padding: const EdgeInsets.all(13.5),
                margin: const EdgeInsets.all(8),
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  
                  // gradient: LinearGradient(
                  
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.5),
                ),
                child: SingleChildScrollView(
                  
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('assets/Perfil.png'),
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.mail),
                            hintText: "Informe o email",
                          ),
                          validator: (String? email) {
                            if (email == null || email.isEmpty) {
                              return "O email não pode ser vazio";
                            } 
                            if (email.length < 6) {
                              return "O email está muito curto";
                            } 
                            if (!email.contains("@")) {
                              return "Email inválido";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: "Informe a senha",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                              child: Icon(
                                _isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                    ),
                            ),
                          ),
                          obscureText: _isObscured,
                          validator: (String? password) {
                            if (password == null || password.isEmpty) {
                              return "A senha não pode ser vazia";
                            }
                            // Adicione mais critérios, se necessário
                            return null;
                          },

                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            buttonEnterClick();
                          },
                          child: const Text(
                            "Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            fixedSize: Size(100, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.5),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(),
                        Text(
                          "Esqueci a senha",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/cadastro");
                          },
                          child: const Text(
                            "Cadastre-se",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 5, 160, 0),
                            fixedSize: Size(125, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, "/home");
    } 
  }
}