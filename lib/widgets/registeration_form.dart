import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterationForm extends StatefulWidget {
  const RegisterationForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterationForm> createState() => _RegisterationFormState();
}

class _RegisterationFormState extends State<RegisterationForm> {
  bool _showPassword = false;
  toggolePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Register',
              style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_rounded),
                label: const Text('Email'),
                hintText: 'almohad@hey.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              obscureText: _showPassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password_outlined),
                suffixIcon: IconButton(
                  onPressed: () => toggolePasswordVisibility(),
                  icon: Icon(
                    _showPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                label: const Text('Password'),
                hintText: '***************',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
