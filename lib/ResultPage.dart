import 'dart:convert';

import 'package:dio/dio.dart' show Dio;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machine_arts/model/Blogger.dart';
import 'package:machine_arts/network/ApiService.dart';

import 'model/Concurrent.dart' show Brands;

class Resultpage extends StatefulWidget {
  final String search;

  const Resultpage({super.key, required this.search});

  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  final dio = Dio();
  late final client;
  late String search;

  int counter = 0;

  @override
  void initState() {
    search = widget.search;
    client = RestClient(dio);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () async {
                _loadBrands();
              },
              icon: Image.asset('assets/search.png'),
            ),
          ),
        ],
        title: SizedBox(
          height: 40,
          child: TextFormField(
            key: ValueKey(counter),
            initialValue: search,
            onChanged: (val) {
              search = val;
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Введите название конкурента',
              hintStyle: TextStyle(fontSize: 13),
              labelText: "Введите название конкурента",
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Color(0xff828386), width: 2.0),
              ),
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: FutureBuilder(
        future: _loadBrands(),
        builder: (_, res) {
          if (res.hasError) {
            print(res.error);
            return Text('Упс, что-то пошло не так');
          }

          if (res.hasData) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Expanded(
                    child: SingleChildScrollView(
                      clipBehavior: Clip.none,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Блоггеры',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FutureBuilder(
                            future: _loadBloggers(),
                            builder: (_, bloggers) {
                              if (bloggers.hasError) {
                                Text('Упс, что-то пошло не так');
                              }

                              if (bloggers.hasData) {
                                return SizedBox(
                                  height: 170,
                                  child: SingleChildScrollView(
                                    clipBehavior: Clip.none,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children:
                                          bloggers.data!
                                              .map(
                                                (blogger) =>
                                                    _bloggerItem(blogger),
                                              )
                                              .toList(),
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                          Divider(),
                          SizedBox(height: 20),
                          Text(
                            'Конкуренты',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ...res.data!
                              .map((brand) => _brandItem(brand))
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _bloggerItem(Blogger blogger) {
    return SizedBox(
      width: 120,
      child: Card(
        elevation: 20,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: Image.network(blogger.photo_url).image,
              ),
              SizedBox(height: 10),
              Text(
                maxLines: 2,
                blogger.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
              Expanded(child: SizedBox.fromSize()),
              Text(
                blogger.subscribers,
                style: TextStyle(fontSize: 10, color: Colors.green),
              ),
              Text(
                blogger.type,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              Text(blogger.description, style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _brandItem(Brands brand) {
    return Card(
      elevation: 20,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        brand.addition_info?.photo_50 == null
                            ? null
                            : Image.network(
                              brand.addition_info!.photo_50!,
                              errorBuilder: (_, _, _) {
                                return SizedBox();
                              },
                            ).image,
                  ),
                  Text(brand.addition_info?.name ?? ''),
                  GestureDetector(
                    child: Text(
                      brand.url ?? '',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      if (brand.url != null) {
                        search = brand.url!.replaceAll('https://vk.com/', '');
                        counter++;
                        setState(() {});
                        _loadBrands();
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brand.addition_info?.members_count.toString() ?? '',
                    style: TextStyle(fontSize: 10, color: Colors.green),
                  ),
                  Text(
                    brand.addition_info?.description ?? '',
                    style: TextStyle(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Text(
                    brand.addition_info?.addresses?.main_address?.address ?? '',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Brands>> _loadBrands() async {
    final brands = await client.getBrands('https://vk.com/$search');
    return brands;
  }

  Future<List<Blogger>> _loadBloggers() async {
    String data = await rootBundle.loadString('assets/bloggers.json');
    final jsonResult = jsonDecode(data);
    return Bloggers.fromJson(jsonResult).bloggers;
  }
}
