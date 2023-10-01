import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:customers_app/theme/customers_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Set text direction to RTL
      child: Theme(
        data: ThemeData(
          primaryColor: CustomersTheme.colors.primaryColor,
          // Add more theme properties as needed
        ),
        child: Scaffold(
          backgroundColor: CustomersTheme.colors.backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        'assets/phone.png',
                        height: 300,
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'تسجيل الدخول',
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' نشكركم على ثقتكم بخدماتنا',
                      style: CustomersTheme.textStyles.titleLarge,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                           color: CustomersTheme.colors.fieldFillColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'الإسم',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomersTheme.colors.fieldFillColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ' كلمة السر',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color:
                              CustomersTheme.colors.primaryColor, // Button color
                          borderRadius: BorderRadius.circular(12),
                        ),
                        
                        child: Center(
                          
                          child: Text(
                            'دخول',
                            style: CustomersTheme.textStyles.titleLarge.copyWith(
                              color: Colors.white, // Text color
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'لا تمتلك حساب؟',
                          style: CustomersTheme.textStyles.titleMedium.copyWith(
                            color: CustomersTheme.colors.displayTextColor,
                          ),
                          textAlign: TextAlign.right, // Apply textAlign here
                        ),
                        // You can add any other widgets here if needed
                        Text(
                          '  إنشاء حساب ',
                          style: CustomersTheme.textStyles.titleMedium.copyWith(
                            color: CustomersTheme.colors
                                .firstSecondaryColor, // Use primaryColor from CustomersTheme.colors
                          ),
                        ),
                        SizedBox(height: 15,),
    
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
