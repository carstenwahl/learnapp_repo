import 'package:flutter/material.dart';
import 'reset_password_screen.dart';

class PasswordResetConfirmationScreen extends StatelessWidget {
  final String email;

  const PasswordResetConfirmationScreen({
    required this.email,
    super.key,
  });

  void _handleResetPassword(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResetPasswordScreen(email: email),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Success Icon
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.mail_outline,
                    size: 60,
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(height: 32),

                // Title
                Text(
                  'Reset-Link gesendet',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.green.shade700,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Message
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.blue.shade200,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Ein Passwort-Reset-Link wurde gesendet an:',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      SelectableText(
                        email,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade700,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Folgen Sie dem Link in der Email, um Ihr Passwort zu ändern.',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Info Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nächste Schritte:',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      _buildInfoItem(context, '1', 'Überprüfen Sie Ihren Posteingang'),
                      _buildInfoItem(context, '2', 'Öffnen Sie die Email von LearnApp'),
                      _buildInfoItem(context, '3', 'Klicken Sie auf "Passwort zurücksetzen"'),
                      _buildInfoItem(context, '4', 'Geben Sie ein neues Passwort ein'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _handleResetPassword(context),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Passwort zurücksetzen',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Info Text
                Text(
                  'Keine Email erhalten? Überprüfen Sie Ihren Spam-Ordner.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    String number,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.amber.shade200,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
