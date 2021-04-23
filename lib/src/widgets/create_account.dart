import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  static Widget create(BuildContext context) => CreateAccount();

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  String? emailValidator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'This is a required field';
    if (value.length < 6) return 'Password should be at least 6 letters';
    if (_passwordController.text != _repeatPasswordController.text) return 'Password do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create account')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: emailValidator,
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                validator: passwordValidator,
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _repeatPasswordController,
                decoration: InputDecoration(labelText: 'Repeat Password'),
                validator: passwordValidator,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      final snackBar = SnackBar(content: Text('Account created!!!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }
}
