import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'password_reset_confirmation_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _secureStorage = const FlutterSecureStorage();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSendResetEmail() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final email = _emailController.text.trim();

      // Check if email exists in storage
      final storedEmail = await _secureStorage.read(key: 'user_email');

      if (storedEmail == null || storedEmail != email) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Diese Email-Adresse ist nicht registriert')),
          );
        }
      } else {
        // Generate a reset token and save it (in production, this would be done server-side)
        final resetToken = DateTime.now().millisecondsSinceEpoch.toString();
        await _secureStorage.write(
          key: 'password_reset_token_$email',
          value: resetToken,
        );

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PasswordResetConfirmationScreen(email: email),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Fehler: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Passwort zurücksetzen'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_reset,
                      size: 50,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Title
                  Text(
                    'Passwort zurücksetzen',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),

                  // Description
                  Text(
                    'Geben Sie Ihre Email-Adresse ein, um einen Passwort-Reset-Link zu erhalten.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'E-Mail',
                      hintText: 'Geben Sie Ihre E-Mail ein',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte geben Sie Ihre E-Mail ein';
                      }
                      if (!value.contains('@')) {
                        return 'Bitte geben Sie eine gültige E-Mail ein';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Send Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleSendResetEmail,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: _isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Reset-Link senden',
                                style: TextStyle(fontSize: 16),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Back Button
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Zurück zur Anmeldung'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
