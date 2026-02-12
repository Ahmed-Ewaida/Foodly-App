import 'package:flutter/material.dart';
import 'package:foodly/details_screen.dart';

import 'data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isSelected = List.generate(2, (_) => false);
  bool _select = true;
  void selectShow() {
    setState(() {
      _select = !_select;
    });
  }
  void addToCart(ProductItems product) {

    final existingIndex = cartItems.indexWhere((item) => item.product.name == product.name);
    if (existingIndex >= 0) {

      cartItems[existingIndex].quantity++;
    } else {

      cartItems.add(CartItem(product: product));
    }
    setState(() {});
  }
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red[50],
              ),
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.search, color: Colors.red),
                    Text("Search for food"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 170,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 8, top: 8),
                              margin: EdgeInsets.only(right: 10),
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(burgerItems[index].image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8, top: 8),
                              height: 24,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                " NODE ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        burgerItems[index].name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: burgerItems.length,
              ),
            ),
            SizedBox(height: 18),
            Text(
              "Features Items",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: selectShow,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _select == true
                              ? Colors.red
                              : Colors.red.shade50,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'List View',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: _select == true
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: selectShow,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _select == true
                              ? Colors.red.shade50
                              : Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Grid View',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: _select == false
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _select == true
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: burgerItems[index])));
                          },
                          child: SizedBox(
                            height: 80,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        burgerItems[index].image,
                                      ),fit: BoxFit.fill
                                    ),
                                  ),margin: EdgeInsets.only(bottom: 4),
                                  width: 100,
                                ),
                                SizedBox(
                            width: 140,
                            child: ListTile(
                              title: Text(
                                burgerItems[index].name,
                                style: TextStyle(fontSize: 16),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                burgerItems[index].desc,
                                style: TextStyle(fontSize: 14),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextButton(
                          onPressed: () {
                            addToCart(burgerItems[index]);
                          },
                          child: Text(
                          "Add to cart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          ),
                          ),
                          ),
                          ),
                                              ],
                          ),
                          ),
                        );
                      },
                      itemCount: burgerItems.length,
                    )
                  : GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 200
                            // mainAxisSpacing: 100
                          ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: burgerItems[index])));
                          },
                          child: SizedBox(
                            height: 350,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          burgerItems[index].image,
                                        ),fit: BoxFit.fill
                                    ),
                                  ),
                                ),
                               ListTile(
                                 title: Text(
                                   burgerItems[index].name,
                                   style: TextStyle(fontSize: 12),
                                   maxLines: 1,
                                   overflow: TextOverflow.ellipsis,
                                 ),
                                 subtitle: Text(
                                   burgerItems[index].desc,
                                   style: TextStyle(fontSize: 10),
                                   maxLines: 1,
                                   overflow: TextOverflow.ellipsis,
                                 ),

                                                               ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                     addToCart(burgerItems[index]);
                                    },
                                    child: Text(
                                      "Add to cart",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      },itemCount: burgerItems.length,
                    ),
            ),
          ],
        ),

    );
  }
}
