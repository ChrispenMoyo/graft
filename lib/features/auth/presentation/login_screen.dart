// GRAFT Login Screen
// Simple login interface for customers and workers

import 'package:flutter/material.dart';
import 'package:graft/core/design_tokens/design_tokens.dart';
import 'package:graft/core/widgets/graft_logo.dart';
import 'package:graft/core/session/session_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // TODO: Implement authentication
      // Simulating network delay
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        setState(() => _isLoading = false);
        // Keep the phone number so profiles can show real details
        SessionManager.instance
            .updateProfile(phoneNumber: '+263 ${_phoneController.text.trim()}');
        // Set customer session with a generated customer ID
        final customerId = 'customer_${DateTime.now().millisecondsSinceEpoch}';
        SessionManager.instance.setCustomerSession(customerId);
        // Navigate based on user role
        Navigator.of(context).pushReplacementNamed('/home');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // GRAFT Logo
              const GraftLogo(
                size: 80,
              ),
              const SizedBox(height: GraftSpacing.xl),

              Text(
                'Welcome back',
                style: GraftTypography.headlineLarge.copyWith(
                  color: GraftColors.textPrimary,
                ),
              ),
              const SizedBox(height: GraftSpacing.sm),
              Text(
                'Enter your phone number to continue',
                style: GraftTypography.bodyMedium.copyWith(
                  color: GraftColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        prefixText: '+263 ',
                        hintText: '712345678',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone number is required';
                        }
                        // Zimbabwe phone number validation (10 digits after +263)
                        if (!RegExp(r'^7[0-9]{8}$').hasMatch(value)) {
                          return 'Enter a valid Zimbabwe phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _submit,
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Continue'),
                      ),
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