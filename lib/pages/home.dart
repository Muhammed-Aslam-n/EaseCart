import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  late SharedPreferences loginData ;
   @override
   void initState(){
     super.initState();
     initial();
   }
  void initial() async {
     loginData = await SharedPreferences.getInstance();
     print("Login Data in Home after logged in is : $loginData");
  }


  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School3',
      style: optionStyle,
    ),
    Text(
      'Index 4: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
        title: const Center(
          child: Text(
            'EaseCart',
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notification On')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            tooltip: 'Logout',
            onPressed: () {
              loginData.setBool('login', true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
            },
          ),
        ],
      ),
      body: const contentClass(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'My Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class contentClass extends StatelessWidget {
  const contentClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(243, 247, 250, 255),
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: const Text(
                  'All Categories',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, right: 15),
                child: const Text(
                  'View all >',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Colors.green),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 10),
                      width: MediaQuery.of(context).size.width / 3,
                      height: 80,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/categoryIcons/spice_icon.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(197, 201, 204, 1),
                                blurRadius: 5,
                                offset: Offset(2.0, 5.75))
                          ]),
                    ),
                    const Text(
                      'Spices',
                      style: TextStyle(color: Color.fromRGBO(69, 70, 71, 1)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 10),
                      width: MediaQuery.of(context).size.width / 3,
                      height: 80,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/categoryIcons/books_icon.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(197, 201, 204, 1),
                                blurRadius: 5,
                                offset: Offset(2.0, 5.75))
                          ]),
                    ),
                    const Text(
                      'Books',
                      style: TextStyle(color: Color.fromRGBO(69, 70, 71, 1)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 10),
                      width: MediaQuery.of(context).size.width / 3,
                      height: 80,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/categoryIcons/vegitable_icon.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(197, 201, 204, 1),
                                blurRadius: 5,
                                offset: Offset(2.0, 5.75))
                          ]),
                    ),
                    const Text(
                      'Vegitables',
                      style: TextStyle(color: Color.fromRGBO(69, 70, 71, 1)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 10),
                      width: MediaQuery.of(context).size.width / 3,
                      height: 80,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/categoryIcons/wardrobe_icon.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(197, 201, 204, 1),
                                blurRadius: 5,
                                offset: Offset(2.0, 5.75))
                          ]),
                    ),
                    const Text(
                      'Furnitures',
                      style:
                      TextStyle(color: Color.fromRGBO(69, 70, 71, 1)),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Hot Deals',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w800),
                ),
                Text(
                  'Hot Deals >',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 11),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                              // padding: EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height / 4.8,
                              width: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(191, 195, 198, 1),
                                        blurRadius: 10,
                                        offset: Offset(2.0, 5.75))
                                  ]),
                              child: Image.asset(
                                  "assets/categoryIcons/books_icon.jpg")),
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: const Text("Book"),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 7),
                            child: const Text("Ruled - 25 ₹"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            // padding: EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height / 4.8,
                              width: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(191, 195, 198, 1),
                                        blurRadius: 10,
                                        offset: Offset(2.0, 5.75))
                                  ]),
                              child: Image.asset(
                                  "assets/categoryIcons/vegitable_icon.jpg")),
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: const Text("Vegitable"),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 7),
                            child: const Text("Fresh - 50 ₹"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            // padding: EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height / 4.8,
                              width: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(191, 195, 198, 1),
                                        blurRadius: 10,
                                        offset: Offset(2.0, 5.75))
                                  ]),
                              child: Image.asset(
                                  "assets/categoryIcons/books_icon.jpg")),
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: const Text("Book"),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 7),
                            child: const Text("Ruled - 25 ₹"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            // padding: EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height / 4.8,
                              width: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(191, 195, 198, 1),
                                        blurRadius: 10,
                                        offset: Offset(2.0, 5.75))
                                  ]),
                              child: Image.asset(
                                  "assets/categoryIcons/vegitable_icon.jpg")),
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: const Text("Vegitable"),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 7),
                            child: const Text("Fresh - 50 ₹"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
