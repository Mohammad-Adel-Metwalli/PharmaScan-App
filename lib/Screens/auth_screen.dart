
import 'package:flutter/material.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/utils/app_text_styles.dart';
import 'package:pharmascan/widgets/custom_button.dart';
import 'package:pharmascan/widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget 
{
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> 
{
  final _formKey = GlobalKey<FormState>();
  bool isLogin = true;
  bool isPassword = true;
  bool isConfirmed = true;

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 200,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              isLogin ? 'Login' : 'Sign Up',
              style: AppTextStyles.text.copyWith(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            CustomTextFormField(
              controller: emailCtrl,
              labelText: 'Email',
              hintText: "e.g example@gmail.com",
              prefixIcon: Icons.email,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Please enter your email';
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                  return 'Invalid email';
                }
                return null;
              },
            ),

            const SizedBox(height: 12),

            CustomTextFormField(
              hintText: 'At least 6 chars',
              controller: passwordCtrl,
              labelText: 'Password',
              prefixIcon: Icons.lock,
              isPassword: true,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Please enter password';
                if (v.length < 6) return 'At least 6 chars';
                return null;
              },
            ),

            const SizedBox(height: 12),

            if(!isLogin)
              CustomTextFormField(
                controller: confirmCtrl,
                labelText: 'Confirm Password',
                hintText: 'At least 6 chars',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Please enter password';
                  if (v.length < 6) return 'At least 6 chars';
                  if (v != passwordCtrl.text) return 'Passwords do not match';
                  return null;
                },
              ),

            if (!isLogin) const SizedBox(height: 12),

            SizedBox(width: double.infinity, height: 48),

            CustomButton(
              color: AppColors.blue,
              text: isLogin ? 'Login' : 'Sign Up',
              onTap: () 
              {
                if(_formKey.currentState!.validate()) 
                {
                  
                }
              },
              height: 55,
              width: 350,
              textStyle: AppTextStyles.text.copyWith(color: Colors.white, fontSize: 20),
            ),
            
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isLogin ? "Don't have an account? " : "Already have an account? "),

                GestureDetector(
                  onTap: () => setState(() => isLogin = !isLogin),
                  child: Text(
                    isLogin ? 'Register Now!' : 'Login Now!',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}