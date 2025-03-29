import 'package:flutter/material.dart';
import 'package:machine_arts/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: AspectRatio(
                    aspectRatio: 3.8,
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
                            Expanded(
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
                                    width: 200,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        prefixIcon: Image.asset(
                                          'assets/search.png',
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: Image.asset('assets/go.png'),
                                        ),
                                        labelText: "Enter Email",
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
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Image.asset('assets/social.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // _loadConcurrents() {
  //   final result = http.read(
  //     Uri.https('newsapi.org', 'v2/top-headlines', {
  //       'country': 'us',
  //       'category': selectedItem,
  //       'apiKey': 'a09d182c6ccd4a4aae4de710b7eba83a',
  //     }),
  //   );
  // }
}
