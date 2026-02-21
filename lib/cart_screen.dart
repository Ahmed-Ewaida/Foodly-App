import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly/cubit/app_cubit.dart';
import 'package:foodly/cubit/app_state.dart';
import 'package:foodly/data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  double _subtotal(AppState state) {
    double total = 0;
    for (final item in state.cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cartItems = state.cartItems;
        final totalSale = _subtotal(state);
        const deliveryFee = 10.0;
        const taxes = 5.0;
        final total = totalSale + deliveryFee + taxes;

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
                      child: const Icon(Icons.library_add_check_outlined),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text("Burger palace"),
                        subtitle: Text("${cartItems.length} Items"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    final product = item.product;
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
                            margin: const EdgeInsets.only(
                                bottom: 4, right: 4),
                            width: 100,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Spacer(),
                                Text(
                                  "Size:${product.size}",
                                  style: const TextStyle(
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
                                const Spacer(),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.read<AppCubit>().updateCartQuantity(
                                        index,
                                        -1,
                                      );
                                },
                                icon: const Icon(Icons.horizontal_rule),
                                iconSize: 15,
                                color: Colors.grey,
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              Text(
                                item.quantity.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<AppCubit>().updateCartQuantity(
                                        index,
                                        1,
                                      );
                                },
                                icon: const Icon(Icons.add),
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
                  itemCount: cartItems.length,
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
                          children: [
                            const Text("Subtotal"),
                            Text("\$ ${totalSale.toStringAsFixed(2)}"),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Delivery fee"),
                            const Text("\$ 10"),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Taxes"),
                            const Text("\$ 5"),
                          ],
                        ),
                        const Divider(height: 12, thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total"),
                            Text("\$ ${total.toStringAsFixed(2)}"),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.red),
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
      },
    );
  }
}
