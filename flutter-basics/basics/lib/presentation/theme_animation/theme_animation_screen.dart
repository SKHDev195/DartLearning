import 'package:basics/application/theme_service.dart';
import 'package:basics/presentation/theme_animation/widgets/moon.dart';
import 'package:basics/presentation/theme_animation/widgets/start.dart';
import 'package:basics/presentation/theme_animation/widgets/sun.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeAnimationScreen extends StatelessWidget {
  const ThemeAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Animation'),
        centerTitle: true,
      ),
      body: Consumer<ThemeService>(
        builder: (context, themeService, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: themeService.isDark
                          ? Colors.black.withOpacity(0.7)
                          : Colors.grey,
                      offset: const Offset(0, 3),
                      blurRadius: 10,
                      spreadRadius: 7,
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: themeService.isDark
                        ? const [
                            Color(0xFF94A9FF),
                            Color(0xFF6B66CC),
                            Color(0xFF200F75),
                          ]
                        : const [
                            Color(0xDDFFFA66),
                            Color(0xDDFFA057),
                            Color(0xDD940B99)
                          ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 130,
                      right: 250,
                      child: AnimatedOpacity(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        opacity: themeService.isDark ? 1 : 0,
                        child: const Star(),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      right: 50,
                      child: AnimatedOpacity(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        opacity: themeService.isDark ? 1 : 0,
                        child: const Star(),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: 200,
                      child: AnimatedOpacity(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        opacity: themeService.isDark ? 1 : 0,
                        child: const Star(),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 400),
                      top: themeService.isDark ? 100 : 130,
                      right: themeService.isDark ? 100 : -40,
                      child: AnimatedOpacity(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        opacity: themeService.isDark ? 1 : 0,
                        child: const Moon(),
                      ),
                    ),
                    AnimatedPadding(
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      padding: EdgeInsets.only(
                        top: themeService.isDark ? 150 : 50,
                      ),
                      child: const Center(child: Sun()),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 225,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: themeService.isDark
                              ? Colors.grey[800]
                              : Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              themeService.isDark ? 'Too dark?' : 'Too bright?',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              themeService.isDark
                                  ? 'Let the Sun rise'
                                  : 'Let it be night',
                              style: const TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Switch(
                              value: themeService.isDark,
                              onChanged: (value) {
                                themeService.toggleTheme();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
