import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Cart {
  final String name;
  final String type;
  final String price;
  final String imageUrl;
  final Color background;
  final Color borderColor;

  Cart(this.name, this.type, this.price, this.imageUrl, this.background, this.borderColor);
}

final List<Cart> subscriptions = [
Cart(
    'Nike Metcon 9',
    'Women\'s Workout Shoes',
    '\$150',
    "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/b331eb60-f72d-4914-bb91-10461ad13a71/metcon-9-womens-workout-shoes-xMlsHx.png",
    const Color.fromARGB(255, 246, 251, 252), // Updated color value
    const Color.fromARGB(255, 72, 136, 165),
  ),

  Cart(
    'Nike Air Max 90 LV8',
    'Women\'s  Shoes',
    '\$150',
    "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/accc6e79-3091-479b-a9b7-22cc00cc0d55/air-max-90-lv8-womens-shoes-h1z13t.png",
   const Color.fromARGB(255, 246, 251, 252), // Updated color value
    const Color.fromARGB(255, 72, 136, 165),
  ),

  Cart(
    'Nike Dunk High',
    'Women\'s  Shoes',
    '\$130',
    'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f0d61cfb-0d85-4d5c-9088-6bae0b15ed04/dunk-high-womens-shoes-LwCxXJ.png',
const Color.fromARGB(255, 246, 251, 252), // Updated color value
    const Color.fromARGB(255, 72, 136, 165),
  ),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Refresh Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CustomRefreshAnimation(),
    );
  }
}

class CustomRefreshAnimation extends StatelessWidget {
  const CustomRefreshAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: use_full_hex_values_for_flutter_colors
      backgroundColor: const Color(0xffff7fafb),
      appBar: AppBar(
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(width: 10),
              /*Text(
                "Cart",
                style: TextStyle(
                  color: Color.fromARGB(173, 75, 71, 71),
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),*/
            ],
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 57, 123, 154),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 57, 123, 154),
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 57, 123, 154),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
          height: 90,
          child: const ListTile(
            title: Text(
              "Total",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Text(
              "\$430",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 5),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LiquidPullToRefresh(
          springAnimationDurationInMilliseconds: 500,
          borderWidth: 2,
          color: const Color.fromARGB(255, 57, 123, 154),
          backgroundColor: Colors.white,
          animSpeedFactor: 2,
          height: MediaQuery.of(context).size.height / 5,
          child: ListView.builder(
            itemCount: subscriptions.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: subscriptions[index].background,
                    border: Border.all(
                      color: subscriptions[index].borderColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        subscriptions[index].imageUrl,
                      ),
                      backgroundColor: Colors.grey.shade300,
                      radius: 23,
                    ),
                    trailing: Text(
                      subscriptions[index].price,
                      style: const TextStyle(
                        // ignore: use_full_hex_values_for_flutter_colors
                        color: Color(0xfff212121),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    title: Text(
                      subscriptions[index].name,
                      style: const TextStyle(
                        // ignore: use_full_hex_values_for_flutter_colors
                        color: Color(0xfff212121),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      subscriptions[index].type,
                      style: const TextStyle(
                        // ignore: use_full_hex_values_for_flutter_colors
                        color: Color(0xfff5d5d5d),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          onRefresh: () => Future.delayed(
            const Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}
