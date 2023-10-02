import 'package:customers_app/screens/home_screen/views/home.dart';
import 'package:customers_app/theme/customers_theme.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Theme(
        data: ThemeData(
          primaryColor: CustomersTheme.colors.primaryColor,
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
                      borderRadius: BorderRadius.circular(32),
                      child: Image.asset(
                        'assets/profile.png',
                        height: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomersTheme.colors.fieldFillColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'الإسم',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomersTheme.colors.fieldFillColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'رقم الهاتف',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomersTheme.colors.fieldFillColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'كلمة السر',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomersTheme.colors.fieldFillColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'اسم ومكان الحي (المنطقة)'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomersTheme.colors.fieldFillColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ElevatedButton(
                          onPressed: () => () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              CustomersTheme.colors.fieldFillColor,
                            ),
                            minimumSize: MaterialStateProperty.all<Size>(
                              const Size.fromHeight(
                                48.0,
                              ), // Adjust the height as needed
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // Align children to start and end
                            children: [
                              Text(
                                'ادراج صورة',
                                style: TextStyle(
                                  color: CustomersTheme.colors.primaryColor,
                                  fontSize: 13, // Match the text style
                                ),
                              ),
                              Icon(
                                Icons.image_outlined,
                                color: CustomersTheme.colors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomersTheme.colors.fieldFillColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: () => () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                CustomersTheme.colors.fieldFillColor,
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size.fromHeight(
                                  48.0,
                                ), // Adjust the height as needed
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // Align children to start and end
                              children: [
                                Text(
                                  'حدد العنوان على الخريطة',
                                  style: TextStyle(
                                    color: CustomersTheme.colors.primaryColor,
                                    fontSize: 13, // Match the text style
                                  ),
                                ),
                                Icon(
                                  Icons.map_outlined,
                                  color: CustomersTheme.colors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: () {
                          // Add your currency selection functionality here
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomersTheme.colors.fieldFillColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your currency selection functionality here
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                CustomersTheme.colors.fieldFillColor,
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size.fromHeight(
                                  48.0,
                                ), // Adjust the height as needed
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // Align children to start and end
                              children: [
                                Text(
                                  'اختر العملة (دولار أمريكي / ريال سعودي / ريال يمني)',
                                  style: TextStyle(
                                    color: CustomersTheme.colors.primaryColor,
                                    fontSize: 13, // Match the text style
                                  ),
                                ),
                                Icon(
                                  Icons.attach_money,
                                  color: CustomersTheme.colors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: CustomersTheme.colors.primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: GestureDetector(
                                child: Text(
                                  'تسجيل',
                                  style: CustomersTheme.textStyles.titleLarge
                                      .copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return const HomePage();
                                  }));
                                }),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' هل تمتلك حساب بالفعل؟',
                          style: CustomersTheme.textStyles.titleMedium.copyWith(
                            color: CustomersTheme.colors.displayTextColor,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        GestureDetector(
                          child: Text(
                            '  تسجيل الدخول ',
                            style:
                                CustomersTheme.textStyles.titleMedium.copyWith(
                              color: CustomersTheme.colors.firstSecondaryColor,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
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
