import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed/models/user_models.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seed/utils/modal_helpers.dart';
import 'package:seed/widgets/app_text_field.dart';
import 'package:seed/widgets/auth_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _district = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _name,
                      label: 'First name',
                      hint: 'John',
                      prefix: const Icon(CupertinoIcons.person),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppTextField(
                      controller: _lastName,
                      label: 'Last name',
                      hint: 'Doe',
                      prefix: const Icon(CupertinoIcons.person),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _userName,
                label: 'Username',
                hint: 'johndoe',
                prefix: const Icon(CupertinoIcons.at),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _phone,
                label: 'Phone number',
                hint: '6 xx xx xx xx',
                keyboardType: TextInputType.phone,
                prefix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 8),
                      child: SvgPicture.asset(
                        'assets/svg/flag_cm.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const Text('+237  '),
                    const VerticalDivider(width: 12, thickness: 1),
                  ],
                ),
              ),
              const SizedBox(height: 16),
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
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _city,
                label: 'City',
                hint: 'Yaoundé',
                prefix: const Icon(CupertinoIcons.location),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _district,
                label: 'District',
                hint: 'Choisir un quartier',
                readOnly: true,
                onTap: () async {
                  final selected = await showModalBottomSheet<String>(
                    context: context,
                    showDragHandle: true,
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      final allDistricts = [
                        'Obili',
                        'Mvog-Betsi',
                        'Mvog-Ada',
                        'Mvog-Betsi Zoo',
                        'Mfandena',
                        'Mballa II',
                        'Ngousso',
                        'Etoa Meki',
                        'Essos',
                        'Nkolbisson',
                        'Etoug-Ebe',
                        'Ekounou',
                        'Olezoa',
                        'Mokolo',
                        'Cité Verte',
                      ];
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: allDistricts.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder:
                            (context, i) => ListTile(
                              leading: const Icon(
                                CupertinoIcons.map_pin_ellipse,
                              ),
                              title: Text(allDistricts[i]),
                              onTap:
                                  () => Navigator.pop(context, allDistricts[i]),
                            ),
                      );
                    },
                  );
                  if (selected != null) {
                    setState(() => _district.text = selected);
                  }
                },
                prefix: const Icon(CupertinoIcons.map_pin_ellipse),
              ),
              const SizedBox(height: 24),
              Center(
                child: AuthButton(
                  label: 'Sign Up',
                  trailingIcon: CupertinoIcons.arrow_right,
                  onPressed: () {
                    final parts = _name.text.trim().split(' ');
                    final user = UserProfile(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      firstName: parts.isNotEmpty ? parts.first : '',
                      lastName:
                          parts.length > 1 ? parts.sublist(1).join(' ') : '',
                      email: _email.text.trim(),
                      phone: _phone.text.trim(),
                      defaultAddress: Address(
                        line1: '',
                        city: _city.text.trim(),
                        postalCode: '',
                        country: 'CI',
                      ),
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                    );
                    showBottomInfo(
                      context: context,
                      title: 'Inscription',
                      message:
                          'Utilisateur simulé créé: ${user.firstName} ${user.lastName}\n(${user.email})',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
