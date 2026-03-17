import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_texts.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSending = false;
  String? _feedbackMessage;
  bool _isSuccess = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSending = true;
      _feedbackMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'service_id': emailJsServiceId,
          'template_id': emailJsTemplateId,
          'user_id': emailJsPublicKey,
          'template_params': {
            'from_name': _nameController.text.trim(),
            'from_phone': _phoneController.text.trim(),
            'from_email': _emailController.text.trim(),
            'subject': _subjectController.text.trim(),
            'message': _messageController.text.trim(),
          },
        }),
      );

      if (response.statusCode == 200) {
        _formKey.currentState!.reset();
        _nameController.clear();
        _phoneController.clear();
        _emailController.clear();
        _subjectController.clear();
        _messageController.clear();
        setState(() {
          _isSuccess = true;
          _feedbackMessage = 'Message sent successfully! I\'ll get back to you soon.';
        });
      } else {
        setState(() {
          _isSuccess = false;
          _feedbackMessage = 'Failed to send message. Please try again.';
        });
      }
    } catch (_) {
      setState(() {
        _isSuccess = false;
        _feedbackMessage = 'Network error. Please check your connection and try again.';
      });
    } finally {
      setState(() => _isSending = false);
    }
  }

  InputDecoration _fieldDecoration(String label, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.05),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white24),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white24),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: seedColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: errorColor, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Send a Message",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
          ),
          const Gap(12),
          // Name
          TextFormField(
            controller: _nameController,
            style: const TextStyle(color: Colors.white, fontSize: 13),
            decoration: _fieldDecoration("Name", hint: "Your full name"),
          ),
          const Gap(10),
          // Phone
          TextFormField(
            controller: _phoneController,
            style: const TextStyle(color: Colors.white, fontSize: 13),
            keyboardType: TextInputType.phone,
            decoration: _fieldDecoration("Phone Number", hint: "+880 XXXXXXXXXX"),
          ),
          const Gap(10),
          // Email (required)
          TextFormField(
            controller: _emailController,
            style: const TextStyle(color: Colors.white, fontSize: 13),
            keyboardType: TextInputType.emailAddress,
            decoration: _fieldDecoration("Email *", hint: "your@email.com"),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email is required';
              }
              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
              if (!emailRegex.hasMatch(value.trim())) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const Gap(10),
          // Subject
          TextFormField(
            controller: _subjectController,
            style: const TextStyle(color: Colors.white, fontSize: 13),
            decoration: _fieldDecoration("Subject", hint: "What is this about?"),
          ),
          const Gap(10),
          // Message
          TextFormField(
            controller: _messageController,
            style: const TextStyle(color: Colors.white, fontSize: 13),
            maxLines: 4,
            decoration: _fieldDecoration("Message", hint: "Write your message here..."),
          ),
          const Gap(14),
          // Feedback message
          if (_feedbackMessage != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: _isSuccess
                    ? Colors.green.withValues(alpha: 0.1)
                    : errorColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _isSuccess ? Colors.green : errorColor,
                  width: 0.5,
                ),
              ),
              child: Text(
                _feedbackMessage!,
                style: TextStyle(
                  color: _isSuccess ? Colors.green : errorColor,
                  fontSize: 12,
                ),
              ),
            ),
            const Gap(10),
          ],
          // Send button
          ElevatedButton(
            onPressed: _isSending ? null : _sendMessage,
            style: ElevatedButton.styleFrom(
              backgroundColor: seedColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: _isSending
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text("Send Message", style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
