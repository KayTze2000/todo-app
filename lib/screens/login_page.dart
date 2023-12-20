import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/home.dart';
import '../screens/custom_clipper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
              width: double.infinity,
              child: _buildInputFields(),
            ),
            _buildSocialLogins(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    return ClipPath(
      clipper: CustomClipperWidget(),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 102, 112, 226),
            Color.fromARGB(155, 3, 10, 140),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 60),
              _buildTextField(emailController, Icons.person_outline, "Email"),
              const SizedBox(height: 20),
              _buildTextField(
                  passwordController, Icons.info_outline, "Password",
                  isPassword: true),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();
                  print("Email : $email Password : $password");

                  // Perform your login logic here, if needed

                  // Navigate to the Home page and replace the current route
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: const Text("LOGIN"),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLogins() {
    return Column(
      children: [
        const Text(
          "Or sign in with",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSocialIconButton("assets/images/google.png", 60),
              _buildSocialIconButton("assets/images/facebook.png", 60),
              _buildSocialIconButton("assets/images/twitter.png", 60),
            ],
          ),
        ),
      ],
    );
  }

Widget _buildSocialIconButton(String imagePath, double size) {
  return Container(
    width: size,
    height: size,
    child: IconButton(
      onPressed: () {},
      icon: Image.asset(imagePath),
      iconSize: size,
    ),
  );
}


  Widget _buildTextField(
    TextEditingController controller,
    IconData icon,
    String hint, {
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      obscureText: isPassword,
    );
  }
}
