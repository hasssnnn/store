import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/product_model.dart';
import '../services/all_products_service.dart';
import '../widgets/custom_card.dart';
import 'add_product_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Trend',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddProductScreen.id);
              },
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProducts().getProducts(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 60,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(productModel: products[index]);
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:untitled/models/product_model.dart';
// import 'package:untitled/services/all_products_service.dart';
// import 'package:untitled/widgets/custom_card.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({
//     super.key,
//   });
//   static String id = 'HomePage';

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<ProductModel> favoriteItems = [];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2, // Changed to 2 tabs (All Products and Favorites)
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'New Trend',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           elevation: 0,
//           centerTitle: true,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 // Navigate to the favorites tab when the cart icon is pressed
//                 DefaultTabController.of(context)!.animateTo(1);
//               },
//               icon: const Icon(
//                 FontAwesomeIcons.cartPlus,
//                 color: Colors.black,
//               ),
//             )
//           ],
//         ),
//         body: TabBarView(
//           children: [
//             // Tab 1: All Products
//             Padding(
//               padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
//               child: FutureBuilder<List<ProductModel>>(
//                 future: GetAllProducts().getProducts(),
//                 builder: ((context, snapshot) {
//                   if (snapshot.hasData) {
//                     List<ProductModel> products = snapshot.data!;
//                     return GridView.builder(
//                       itemCount: products.length,
//                       clipBehavior: Clip.none,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 60,
//                         crossAxisSpacing: 10,
//                         childAspectRatio: 1.5,
//                       ),
//                       itemBuilder: (context, index) {
//                         return CustomCard(
//                           productModel: products[index],
//                           isFavorite: favoriteItems.contains(products[index]),
//                           onFavoritePressed: () {
//                             // Toggle the favorite status of the product
//                             setState(() {
//                               if (favoriteItems.contains(products[index])) {
//                                 favoriteItems.remove(products[index]);
//                               } else {
//                                 favoriteItems.add(products[index]);
//                               }
//                             });
//                           },
//                         );
//                       },
//                     );
//                   } else {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                 }),
//               ),
//             ),

//             // Tab 2: Favorites
//             ListView.builder(
//               itemCount: favoriteItems.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(favoriteItems[index].title),
//                   // Add any other information you want to display for favorites
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





// ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:untitled/models/product_model.dart';
// import 'package:untitled/services/all_products_service.dart';
// import 'package:untitled/widgets/custom_card.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({
//     super.key,
//   });
//   static String id = 'HomePage';

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<ProductModel> favoriteItems = [];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2, // Changed to 2 tabs (All Products and Favorites)
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'New Trend',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           elevation: 0,
//           centerTitle: true,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 // Navigate to the favorites tab when the cart icon is pressed
//                 DefaultTabController.of(context)!.animateTo(1);
//               },
//               icon: const Icon(
//                 FontAwesomeIcons.cartPlus,
//                 color: Colors.black,
//               ),
//             )
//           ],
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'All Products'),
//               Tab(text: 'Favorites'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // Tab 1: All Products
//             Padding(
//               padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
//               child: FutureBuilder<List<ProductModel>>(
//                 future: GetAllProducts().getProducts(),
//                 builder: ((context, snapshot) {
//                   if (snapshot.hasData) {
//                     List<ProductModel> products = snapshot.data!;
//                     return GridView.builder(
//                       itemCount: products.length,
//                       clipBehavior: Clip.none,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 60,
//                         crossAxisSpacing: 10,
//                         childAspectRatio: 1.5,
//                       ),
//                       itemBuilder: (context, index) {
//                         return CustomCard(
//                           productModel: products[index],
//                           isFavorite: favoriteItems.contains(products[index]),
//                           onFavoritePressed: () {
//                             // Toggle the favorite status of the product
//                             setState(() {
//                               if (favoriteItems.contains(products[index])) {
//                                 favoriteItems.remove(products[index]);
//                               } else {
//                                 favoriteItems.add(products[index]);
//                               }
//                             });
//                           },
//                         );
//                       },
//                     );
//                   } else {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                 }),
//               ),
//             ),

//             // Tab 2: Favorites
//             ListView.builder(
//               itemCount: favoriteItems.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(favoriteItems[index].title),
//                   // Add any other information you want to display for favorites
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
