import 'package:flutter/material.dart';
import 'package:foodly/data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> numOfProduct = cartItems;

  @override
   double totalSale = 0 ;
  getTotal(double sale, int amout ){
    totalSale=sale * amout;
  }
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.yellow.shade50,
                  ),
                  child: Icon(Icons.library_add_check_outlined),
                ),
                Expanded(
                  child: ListTile(
                    title: Text("Burger palace"),
                    subtitle: Text("${cartItems.length} Items"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final product = numOfProduct[index].product;
                return SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: NetworkImage(product.image),
                            fit: BoxFit.fill,
                          ),
                        ),
                        margin: EdgeInsets.only(bottom: 4, right: 4),
                        width: 100,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            Text(
                              "Size:${product.size}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Burger palace",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                numOfProduct[index].quantity == 1
                                    ? numOfProduct.removeAt(index)
                                    : numOfProduct[index].quantity--;
                                getTotal(product.price,numOfProduct[index].quantity);
                              });
                            },
                            icon: Icon(Icons.horizontal_rule),
                            iconSize: 15,
                            color: Colors.grey,
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.grey.shade300,
                              ),
                            ),
                          ),
                          Text(
                            numOfProduct[index].quantity.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                numOfProduct[index].quantity++;
                                getTotal(product.price,numOfProduct[index].quantity);
                              });
                            },
                            icon: Icon(Icons.add),
                            iconSize: 15,
                            color: Colors.grey,
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: numOfProduct.length,
            ),
          ),
          SizedBox(
            height: 250,
            child: Card(
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Subtotal"),Text("\$ ${totalSale.toStringAsFixed(2)}")],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Delivery fee"),Text("\$ 10")],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Taxes"),Text("\$ 5")],
                    ),
                    const SizedBox(height: 4),
                    const Divider(height: 12, thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Total"),Text("\$ ${(totalSale+15).toStringAsFixed(2)}")],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.red),
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
