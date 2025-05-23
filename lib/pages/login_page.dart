import 'package:flutter/material.dart';
import 'package:fitness/pages/select_language.dart'; // Update import

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double blueStart = 0.79;
    double blueEnd = 0.88;

    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTapDown: (details) {
              final size = MediaQuery.of(context).size;
              final tapY = details.localPosition.dy / size.height;
              if (tapY > blueStart && tapY < blueEnd) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectLanguagePage()),
                );
              }
            },
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Image.asset(
                    'assets/images/login2templatev2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.07),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    width: 380,
                    child: TextField(
                      focusNode: _usernameFocus,
                      controller: _usernameController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                      ),
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        prefixIcon: null,
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_passwordFocus);
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.35),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    width: 380,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            focusNode: _passwordFocus,
                            obscureText: _obscurePassword,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                            ),
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '',
                              prefixIcon: null,
                              fillColor: Colors.transparent,
                              filled: true,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}