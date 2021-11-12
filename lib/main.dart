import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Exam App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState(title: title);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({required this.title}) {
    // через 3 секунды выключится заставка
    Timer(Duration(seconds: 3), () {
      setState(() {
        splash = false;
      });
    });
  }

  final String title;
  bool splash = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      // сначала splash, проверка на таймер
      body: (splash)
          ? GestureDetector(
              onTap: () {
                setState(() {
                  // выключение сплеша по тапу
                  splash = false;
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://netmaek.ru/wa-data/public/shop/products/55/91/19155/images/125165/125165.480x0.jpg',
                        ),
                        fit: BoxFit.cover,
                      ))),
            )
          : Center(
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 24,
                childAspectRatio: 1,
                crossAxisCount: 1,
                children: [
                  createNewsCard('Заголовок №1', '12 ноября 2021',
                      'https://horrorzone.ru/uploads/_pages/11014/fotolia_16722530_subscription_l.jpg'),
                  createNewsCard('Заголовок №2', '12 ноября 2021',
                      'https://horrorzone.ru/uploads/_pages/11014/fotolia_16722530_subscription_l.jpg'),
                  createNewsCard('Заголовок №3', '12 ноября 2021',
                      'https://horrorzone.ru/uploads/_pages/11014/fotolia_16722530_subscription_l.jpg'),
                  createNewsCard('Заголовок №4', '12 ноября 2021',
                      'https://horrorzone.ru/uploads/_pages/11014/fotolia_16722530_subscription_l.jpg'),
                  createNewsCard('Заголовок №5', '12 ноября 2021',
                      'https://horrorzone.ru/uploads/_pages/11014/fotolia_16722530_subscription_l.jpg'),
                  createNewsCard('Заголовок №6', '12 ноября 2021',
                      'https://horrorzone.ru/uploads/_pages/11014/fotolia_16722530_subscription_l.jpg'),
                  createNewsCard('Заголовок №7', '12 ноября 2021',
                      'https://horrorzone.ru/uploads/_pages/11014/fotolia_16722530_subscription_l.jpg'),
                  createNewsCard('Заголовок №8', '12 ноября 2021',
                      'https://horrorzone.ru/uploads/_pages/11014/fotolia_16722530_subscription_l.jpg'),
                  createNewsCard('Заголовок №9', '12 ноября 2021',
                      'https://horrorzone.ru/uploads/_pages/11014/fotolia_16722530_subscription_l.jpg'),
                  createNewsCard('Заголовок №10', '12 ноября 2021',
                      'https://horrorzone.ru/uploads/_pages/11014/fotolia_16722530_subscription_l.jpg'),
                ],
              ),
            ),
      drawer: createDrawer(context),
    );
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}

Drawer createDrawer(BuildContext context) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 100,
          // padding: EdgeInsets.symmetric(vertical: 12),
          child: const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Лента Новостей',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ListTile(
          title: const Text(
              'Экзаменационное задание по дисциплине Разработка Безопасных Мобильных приложений Московский Политех 2021'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        const Image(
          image: NetworkImage(
              'https://profkommospolytech.ru/uploads/images/partners/large/0b6dd8bb96f9fc0544405b04019e34b7.png'),
        ),
        ListTile(
          title: const Text('Автор: trevia78@mail.ru'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('https://github.com/putentsar/mob_exam_final.git'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

Widget createNewsCard(String title, String date, String urlImage) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.indigo[100],
        border: Border.all(width: 1.0, color: Colors.cyan),
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [BoxShadow(color: Colors.cyan, blurRadius: 4)]),
    // color: Colors.red,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        Container(
          margin: EdgeInsets.symmetric(vertical: 18),
          child: Flexible(
              child: Image(
            image: NetworkImage(urlImage),
          )),
        ),
        Text(date),
      ],
    ),
  );
}
