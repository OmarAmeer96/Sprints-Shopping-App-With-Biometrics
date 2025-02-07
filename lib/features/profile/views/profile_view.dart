import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticated = false;
  bool _isCheckingBiometrics = true;

  @override
  void initState() {
    super.initState();
    _checkBiometricsAndAuthenticate();
  }

  Future<void> _checkBiometricsAndAuthenticate() async {
    try {
      final bool canCheck = await auth.canCheckBiometrics;
      final List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      if (!canCheck || availableBiometrics.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Biometric authentication not available.'),
          ),
        );
        Navigator.pop(context);
        return;
      }

      final bool authenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to access your profile',
        options: const AuthenticationOptions(biometricOnly: true),
      );

      setState(() {
        _isAuthenticated = authenticated;
        _isCheckingBiometrics = false;
      });

      if (!authenticated) {
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Authentication failed: $e'),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isCheckingBiometrics || !_isAuthenticated) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png'),
            ),
            SizedBox(height: 16),
            Text(
              'Omar Ameer Mohamed',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'omar@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
