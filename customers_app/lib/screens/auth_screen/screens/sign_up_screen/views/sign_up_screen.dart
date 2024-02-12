import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/customers_theme.dart';
import '../../../views/widgets/auth_field.dart';
import '../../../../../widgets/auth_button.dart';
import '../../../providers/auth_provider.dart';
import '../providers/sign_up_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context, listen: false);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Theme(
        data: ThemeData(
          primaryColor: CustomersTheme.colors.primaryColor,
        ),
        child: Scaffold(
          backgroundColor: CustomersTheme.colors.backgroundColor,
          body: SafeArea(
            child: Form(
              key: signUpProvider.formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'قم بتعبئة البيانات التالية',
                        style: CustomersTheme.textStyles.titleLarge,
                        selectionColor:
                            CustomersTheme.textSelectionTheme.selectionColor,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthField(
                        decoration: CustomersInputDecoration.primary(
                            label: 'اسم المستخدم'),
                        inputType: TextInputType.text,
                        controller: signUpProvider.usernameController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AuthField(
                        decoration: CustomersInputDecoration.primary(
                            label: 'الاسم الكامل'),
                        inputType: TextInputType.text,
                        controller: signUpProvider.fullNameController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AuthField(
                        decoration: CustomersInputDecoration.primary(
                            label: 'رقم الهاتف'),
                        inputType: TextInputType.number,
                        controller: signUpProvider.phoneNumberController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AuthField(
                        decoration: CustomersInputDecoration.primary(
                            label: 'كلمة المرور'),
                        inputType: TextInputType.text,
                        controller: signUpProvider.passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Consumer<SignUpProvider>(
                        builder: (context, signUpConsumer, _) {
                          return AuthButton(
                            onClick: signUpConsumer.isLoading
                                ? null
                                : () => signUpProvider.signUp(context: context),
                            child: signUpConsumer.isLoading
                                ? const Center(
                                    child: SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    'دخول',
                                    style: CustomersTheme.textStyles.titleLarge
                                        .copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'هل تمتلك حساب بالفعل؟',
                            style:
                                CustomersTheme.textStyles.titleMedium.copyWith(
                              color: CustomersTheme.colors.displayTextColor,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          TextButton(
                            child: Text(
                              'تسجيل دخول',
                              style: CustomersTheme.textStyles.titleMedium,
                            ),
                            onPressed: () => Provider.of<AuthProvider>(context,
                                    listen: false)
                                .switchScreen('login'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
