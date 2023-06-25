import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:photo_album_app/screen/dashboard_screen.dart';

class PINScreen extends StatelessWidget {
  PINScreen({Key? key}) : super(key: key);
  final LocalAuthentication localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/loginBg.jpeg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTap: () async {
            bool weCanCheckBiometrics = await localAuth.canCheckBiometrics;

            if (weCanCheckBiometrics) {
              bool isAuthenticated = await localAuth.authenticate(
                localizedReason: "Login Page",
              );
              if (isAuthenticated) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ),
                );
              }
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Text(
                  "Photo Album App",
                  style: GoogleFonts.pacifico(
                    fontSize: 36.0,
                    color: Color.fromARGB(255, 248, 180, 202),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.fingerprint,
                      size: 50.0,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Touch to login",
                      style: GoogleFonts.pacifico(
                        fontSize: 27.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
