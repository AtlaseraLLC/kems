import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_button/animated_button.dart';
import 'package:kems/screens/settings_screen.dart';
import 'game_screen.dart';
import 'about_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            ClipOval(
              child: Image.asset(
                'assets/images/logo.png',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 100),
            _MenuButton(label: 'PLAY', onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const GameScreen()));
            }),
            _MenuButton(label: 'Settings', onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()));
            }),
            _MenuButton(label: 'ABOUT', onTap: () {Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AboutScreen()));}),
            _MenuButton(label: 'QUIT', onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => AlertDialog(
                  insetPadding: const EdgeInsets.only(top: 50, left: 40, right: 40),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: const Text(
                    'Quit Game?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  content: const Text(
                    'Are you sure you want to quit?',
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  actionsPadding: EdgeInsets.zero,
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: AnimatedButton(
                              onPressed: () => SystemNavigator.pop(),
                              color: const Color(0xFFf64900),
                              height: 40,
                              borderRadius: 8,
                              shadowDegree: ShadowDegree.dark,
                              child: const Text('YES',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: AnimatedButton(
                              onPressed: () => Navigator.pop(context),
                              color: Colors.white24,
                              height: 40,
                              borderRadius: 8,
                              shadowDegree: ShadowDegree.light,
                              child: const Text('NO',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _MenuButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width * 0.7;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AnimatedButton(
        onPressed: onTap,
        color: const Color(0xFFf64900),
        width: buttonWidth,
        height: 52,
        borderRadius: 8,
        shadowDegree: ShadowDegree.dark,
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}