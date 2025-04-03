import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(  // Sử dụng SingleChildScrollView để cuộn toàn bộ nội dung
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/image/vitaminmeo.jpg',
                          height: 500,
                          width: 500,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 160,
                          top: 205,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 500,
                      child: Column(
                        children: [
                          Expanded(child: ListView(
                            children: [Image.asset(
                              'assets/image/images.jpg',
                              height: 600,
                              width: 400,
                              fit: BoxFit.cover,
                            )],
                          )),
                          SizedBox(height: 20,),
                          Expanded(child: ListView(
                            children: [Image.asset(
                              'assets/image/images.jpg',
                              height: 600,
                              width: 400,
                              fit: BoxFit.cover,
                            )],
                          ))
                        ],
                      ),
                    ),
                    Container(
                      height: 500,
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: ListView(scrollDirection: Axis.horizontal,
                                children: [
                                  Image.asset('assets/image/images.jpg')
                                ],
                          )),
                          Expanded(
                              child: ListView(scrollDirection: Axis.horizontal,
                                children: [
                                  Image.asset('assets/image/mydiu.jpg')
                                ],
                          )),
                        ],
                      ),
                    ),

              Container(
                height: 700,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 700,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Image.asset(
                                        'assets/image/viruss.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Image.asset(
                                        'assets/image/viruss.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 700,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Image.asset(
                                        'assets/image/viruss.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Image.asset(
                                        'assets/image/viruss.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
