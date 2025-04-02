import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Center(
            child: Image.asset("assests/travel3.png", height: 150,),
          ),
              SizedBox(height: 20),
             
              Center(child: Text("Please enter your credentials to access your account")),
              SizedBox(height: 20),
              _buildTextField("Name ", "Enter your name"),
              SizedBox(height: 10),
              _buildTextField("Email", "example@gmail.com"),
              SizedBox(height: 10),
              _buildTextField("Password", "at least 8 characters", isPassword: true),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text("I agree to the "),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Terms & Privacy",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text("Register",  style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Already have an account? Log in",
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: isPassword ? Icon(Icons.visibility_off) : null,
      ),
    );
  }

  Widget _buildSocialButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}

