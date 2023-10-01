import 'package:flutter/material.dart';
import 'package:customers_app/theme/customers_theme.dart';

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
                      child: Image.asset(
                        'assets/profile.png',
                        height: 300,
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'قم بتعبئة البيانات التالية',
                      style: CustomersTheme.textStyles.titleLarge,
                      selectionColor:
                          CustomersTheme.textSelectionTheme.selectionColor,
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomersTheme.colors.fieldFillColor,
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
                            obscureText: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'رقم الهاتف',
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
                              hintText: 'كلمة السر',
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
                        decoration: BoxDecoration(
                          color: CustomersTheme.colors.fieldFillColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'اسم ومكان الحي (المنطقة)'),
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
                              Size.fromHeight(
                                48.0,
                              ), // Adjust the height as needed
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Align children to start and end
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

                    SizedBox(
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
                                Size.fromHeight(
                                  48.0,
                                ), // Adjust the height as needed
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Align children to start and end
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

                    SizedBox(
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
                                Size.fromHeight(
                                  48.0,
                                ), // Adjust the height as needed
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Align children to start and end
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

                    SizedBox(
                      height: 15,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: CustomersTheme.colors.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'تسجيل',
                            style:
                                CustomersTheme.textStyles.titleLarge.copyWith(
                              color: Colors.white,
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
                          ' هل تمتلك حساب بالفعل؟',
                          style: CustomersTheme.textStyles.titleMedium.copyWith(
                            color: CustomersTheme.colors.displayTextColor,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          '  تسجيل الدخول ',
                          style: CustomersTheme.textStyles.titleMedium.copyWith(
                            color: CustomersTheme.colors.firstSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
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
