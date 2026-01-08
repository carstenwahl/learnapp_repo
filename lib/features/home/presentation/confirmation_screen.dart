import 'package:flutter/material.dart';
import 'home_page.dart';

class ConfirmationScreen extends StatelessWidget {
  final String email;

  const ConfirmationScreen({
    required this.email,
    super.key,
  });

  void _handleReturnToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (route) => false,
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
                    Icons.check_circle,
                    size: 60,
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(height: 32),

                // Title
                Text(
                  'Konto erfolgreich erstellt!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.green.shade700,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Email Confirmation Message
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
                      Icon(
                        Icons.mail_outline,
                        size: 40,
                        color: Colors.blue.shade700,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Email-Bestätigung gesendet',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Eine Bestätigungsemail wurde an:',
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
                        'Bitte bestätigen Sie Ihre Email-Adresse, um Ihr Konto zu aktivieren.',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Instructions
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
                      _buildInstructionItem(
                        context,
                        '1',
                        'Überprüfen Sie Ihren Posteingang',
                      ),
                      _buildInstructionItem(
                        context,
                        '2',
                        'Klicken Sie auf den Bestätigungslink',
                      ),
                      _buildInstructionItem(
                        context,
                        '3',
                        'Melden Sie sich mit Ihren Zugangsdaten an',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Back Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _handleReturnToLogin(context),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Zur Anmeldung',
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

  Widget _buildInstructionItem(
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
