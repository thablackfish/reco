// For handling delay

import 'package:flutter/material.dart';
import 'package:reco/src/settings/settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;
// Future<void> _switchAccount(BuildContext context) async {
//   final TextEditingController keyController = TextEditingController();
//   final roleKeys = {
//     'user': 'USER123', // Example key for users
//     'security': 'SECURITY123', // Example key for the security team
//   };

//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: const Text('Switch Account'),
//         content: TextField(
//           controller: keyController,
//           decoration: const InputDecoration(
//             labelText: 'Enter your role key',
//             hintText: 'e.g., USER123 or SECURITY123',
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               FocusScope.of(context).unfocus(); // Close keyboard
//               Navigator.pop(context); // Close dialog
//             },
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               final enteredKey = keyController.text.trim();
//               String? newRole;

//               // Validate the key
//               if (roleKeys.containsValue(enteredKey)) {
//                 newRole = roleKeys.entries
//                     .firstWhere((entry) => entry.value == enteredKey)
//                     .key;

//                 // Save the role locally
//                 final prefs = await SharedPreferences.getInstance();
//                 await prefs.setString('userRole', newRole);
//                   if (context.mounted) {
//                 Navigator.pop(context); // Close dialog
//                 keyController.clear(); }// Clear text field

//                 // Redirect to the appropriate dashboard
//                 if (newRole == 'user' &&  context.mounted) {
                  
//                   Navigator.pushAndRemoveUntil(
                    
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const UserFeatureGridView(),
//                     ),
//                     (route) => false,
//                   );
//                 } else if (newRole == 'security' &&  context.mounted) {
//                   Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const SecFeatureGridView(),
//                     ),
//                     (route) => false,
//                   );
//                 }
//               } else {
//                 // Invalid key
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: const Text(
//                         'Invalid key. Please enter a valid role key.'),
//                     action: SnackBarAction(
//                       label: 'Help',
//                       onPressed: () {
//                         // Optionally navigate to a help page
//                       },
//                     ),
//                   ),
//                 );
//               }
//             },
//             child: const Text('Submit'),
//           ),
//         ],
//       );
//     },
//   );
// }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Account Information Section
            ListTile(
              title: const Text('Account Information'),
              subtitle: const Text('Manage your account details'),
              onTap: () {
                // Navigate to account management screen if needed
              },
            ),
            const Divider(),

            // Security Settings Section
            ListTile(
              title: const Text('Nearby Settings'),
              subtitle: const Text('Manage location and notifications'),
              onTap: () {
                // Navigate to security settings if needed
              },
            ),
            const Divider(),

            // Privacy Settings Section
            ListTile(
              title: const Text('Privacy Settings'),
              subtitle: const Text('Control data sharing and preferences'),
              onTap: () {
                // Navigate to privacy settings if needed
              },
            ),
            const Divider(),

            // Support & Help Section
            ListTile(
              title: const Text('Support & Help'),
              subtitle: const Text('Access FAQs and contact support'),
              onTap: () {
                // Navigate to support page
              },
            ),
            const Divider(),
            // Swicth Account Section
          //  ListTile(
          //     title: const Text('Switch Account'),
          //     trailing: const Icon(Icons.swap_horiz),
          //     onTap: () => _switchAccount(context),
          //   ),

            const Divider(),

            // Theme Mode Section
            ListTile(
              title: const Text('Theme Settings'),
              subtitle: const Text('Choose between light and dark modes'),
              trailing: DropdownButton<ThemeMode>(
                value: controller.themeMode,
                onChanged: controller.updateThemeMode,
                items: const [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text('System Theme'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text('Light Theme'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text('Dark Theme'),
                  ),
                ],
              ),
            ),
            const Divider(),

            // About Section
            ListTile(
              title: const Text('About'),
              subtitle: const Text('App version, terms, privacy policy'),
              onTap: () {
                // Navigate to About screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
