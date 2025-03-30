import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:machine_arts/Login.dart';
import 'package:machine_arts/ResultPage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machine Arts',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/back.png', fit: BoxFit.fill),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  'Войти',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 500),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              Image.asset(
                                'assets/analyze.png',
                                fit: BoxFit.fill,
                              ).image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    'Анализ рынка',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    'Получить анализ рынка и его сегментацию',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 40,
                                    width: 250,
                                    child: TextField(
                                      onChanged: (val) {
                                        query = val;
                                        setState(() {});
                                      },
                                      style: TextStyle(fontSize: 13),
                                      decoration: InputDecoration(
                                        hintText: 'Введите название конкурента',
                                        hintStyle: TextStyle(fontSize: 13),
                                        prefixIconConstraints: BoxConstraints(
                                          maxHeight: 35,
                                          maxWidth: 35,
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/search.png',
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () async {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder:
                                                    (context) => Resultpage(
                                                      search: query,
                                                    ),
                                              ),
                                            );
                                          },
                                          icon: Image.asset(
                                            'assets/go.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                        ),
                                        labelText:
                                            "Введите название конкурента",
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            25.0,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            25.0,
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0xff828386),
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            if (kIsWeb)
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 150),
                                child: Image.asset('assets/social.png'),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
