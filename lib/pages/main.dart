import 'package:eashtonsfishies/firebase/authentication_respitory.dart';
import 'package:eashtonsfishies/pages/admin_pages/admin_page.dart';
import 'package:eashtonsfishies/pages/admin_pages/user_view.dart';
import 'package:eashtonsfishies/pop/cart_provider.dart';
import 'package:eashtonsfishies/pop/login_button.dart';//page
import 'package:eashtonsfishies/pages/user_pages/product_list_page.dart';//page
import 'package:eashtonsfishies/pages/user_pages/basket.dart';//page
import 'package:provider/provider.dart';
import 'user_pages/about_page.dart';//page
import 'package:get/get.dart';//line 28 following coding with t 
import 'package:eashtonsfishies/pages/admin_pages/inventory_page.dart';//page


import 'package:flutter/material.dart';//resporitory
import 'package:firebase_core/firebase_core.dart';//resporitory
import 'package:eashtonsfishies/firebase/firebase_options.dart';// is in lib/firebase/firebase_options.dart


import 'package:eashtonsfishies/pages/authentication/auth_page.dart';//part of the page
import 'package:eashtonsfishies/pop/home_page_text.dart'; // part of the page

const bool showDebuggedBanner = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRespitory()));
  runApp(
    ChangeNotifierProvider(create: (context) => CartProvider(),
    child: MyApp(),
    ),  
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: showDebuggedBanner,
      routes: {
        'Fish': (context) => ProductList(),// clicks both bevcause of size.
        'About': (context) => AboutPage(),
        'basket': (context) => Basket(),
        'SignUp | Login': (context) => AuthGate(),
        'inventory': (context) => InventoryPage(),
        'users': (context) => UserListPage(),
        'admin': (context) => AdminHomePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Play fair Display',
        )),
      home: const HomeView());
  }
}


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: CentredView(
        child: ScrollState(),
      )
    );
  }
}
class ScrollState extends StatefulWidget {
  const ScrollState({super.key});

  @override
  ScrollableSection createState() => ScrollableSection();
}

class ScrollableSection extends State<ScrollState> {
  //final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      //controller: _scrollController,
      children: <Widget>[
        NavigationBar(),
        Row(
          children: <Widget>[
            FishAdText(),
            FishPageLogin('SignUp | Login'),
          ],
        ),
        SizedBox(
          height: 100,
        ),
        Row(
          children: <Widget>[
            FishAdText(),
            FishPageLogin('SignUp | Login'),
          ],
        ),
        SizedBox(
          height: 100,
        ),
        Row(
          children: <Widget>[
            FishAdText(),
            FishPageLogin('SignUp | Login'),
          ],
        ),
        SizedBox(
          height: 100,
        ),
        Row(
          children: <Widget>[
            FishAdText(),
            FishPageLogin('SignUp | Login'),
          ],
        ),
        ],
    );
  }
}



class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
          height:80,
          width:150,
          child:Image.asset('images/ashtonslogosml.png'),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _NavBarItem('Fish'),
              SizedBox(
                width:20,
              ),
              _NavBarItem('About'),
              SizedBox(
                width:20,
              ),
              _NavBarItem('SignUp | Login'),
            ],
          ),
        ]
      )
    );
  }
}

class _NavBarItem extends StatelessWidget{
  final String title;
  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, title);
        
      },
    
      child: Text(//can have a child in each widget, see weather or not in the documentation in the widgetbar
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class CentredView extends StatelessWidget {
  final Widget child;
  const CentredView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 60),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child:child,
        ),
    );
  }
}

//scrollable