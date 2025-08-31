import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:seed/screens/auth/register_screen.dart';
import 'package:seed/theme/design_system.dart';
import 'package:seed/utils/modal_helpers.dart';
import 'package:seed/utils/navigation_helper.dart';
import 'package:seed/widgets/app_text_field.dart';
import 'package:seed/widgets/auth_button.dart';
import 'package:seed/widgets/social_button.dart';
// no direct navigation to home here

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _keepLogged = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        CupertinoIcons.cube,
                        color: AppColors.brandPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'SEED DELIVERY',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  const Spacer(),
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap:
                        () => showBottomInfo(
                          context: context,
                          title: 'Biometric',
                          message:
                              'Not Found Biometric data\'s on this device. Please fill all fields before to continue...',
                          icon: FontAwesome.fingerprint_solid,
                        ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: const Icon(
                        FontAwesome.fingerprint_solid,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Stay Connected With Us',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Stay connected with us for updates, tips,\nand everything you need to boost',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 24),
              AppTextField(
                controller: _email,
                label: 'Email',
                hint: 'you@example.com',
                keyboardType: TextInputType.emailAddress,
                prefix: const Icon(CupertinoIcons.envelope),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _password,
                label: 'Password',
                hint: '********',
                obscure: true,
                prefix: const Icon(CupertinoIcons.lock),
                suffix: const Icon(CupertinoIcons.eye_slash),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: _keepLogged,
                    onChanged: (v) => setState(() => _keepLogged = v ?? false),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: AppColors.brandPrimary,
                  ),
                  const Text('Keep me logged in.'),
                  const Spacer(),
                  TextButton(
                    onPressed:
                        () => showBottomInfo(
                          context: context,
                          title: 'Forgot Password?',
                          message:
                              'Entrez votre email dans l’écran d’inscription pour réinitialiser.',
                        ),
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Center(
                child: AuthButton(
                  label: 'Login',
                  trailingIcon: CupertinoIcons.arrow_right,
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                    showBottomInfo(
                      context: context,
                      title: 'Sign in',
                      message:
                          'Simulated connection. To be connected to the API later...',
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Or log in with'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const SocialButton(
                    label: 'Manger2',
                    icon: Icon(CupertinoIcons.cube_box_fill),
                    // assetPath: 'assets/img/apple.png',
                  ),
                  const SizedBox(width: 12),
                  const SocialButton(
                    label: 'Google',
                    icon: Icon(CupertinoIcons.cube_box_fill),
                    assetPath: 'assets/img/google.png',
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap:
                        () => NavigationHelper.pushFade(
                          context,
                          const RegisterScreen(),
                        ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: AppColors.brandPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
