import 'package:flutter/material.dart';
import 'package:flutter_remote_jobs_app/src/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote Jobs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
      home: RemoteJobsApp(),
    );
  }
}

class RemoteJobsApp extends StatefulWidget {
  const RemoteJobsApp({Key? key}) : super(key: key);

  @override
  State<RemoteJobsApp> createState() => _RemoteJobsAppState();
}

class _RemoteJobsAppState extends State<RemoteJobsApp> {

  static const _screens = [
    HomeScreen(),
    // SearchScreen(),
    // FavoriteScreen()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search),
            label: '検索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'メッセージ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'お気に入り',
          ),
        ],
      ),
    );
  }
}
