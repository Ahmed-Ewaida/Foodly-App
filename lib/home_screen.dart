import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly/cubit/app_cubit.dart';
import 'package:foodly/cubit/app_state.dart';
import 'package:foodly/details_screen.dart';
import 'package:foodly/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static List<ProductItems> _filterByQuery(
      List<ProductItems> items, String query) {
    if (query.isEmpty) return items;
    final lower = query.toLowerCase();
    return items
        .where((p) =>
            p.name.toLowerCase().contains(lower) ||
            p.desc.toLowerCase().contains(lower))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (prev, curr) =>
          prev.isListView != curr.isListView ||
          prev.cartItems.length != curr.cartItems.length ||
          prev.searchQuery != curr.searchQuery,
      builder: (context, state) {
        final filteredItems = _filterByQuery(burgerItems, state.searchQuery);

        return Padding(
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
                child: TextField(
                  onChanged: (value) =>
                      context.read<AppCubit>().setSearchQuery(value),
                  decoration: InputDecoration(
                    hintText: 'Search for food',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: const Icon(Icons.search, color: Colors.red),
                    suffixIcon: state.searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, size: 20),
                            onPressed: () =>
                                context.read<AppCubit>().clearSearch(),
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final item = filteredItems[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                margin: const EdgeInsets.only(right: 10),
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(item.image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8, top: 8),
                                height: 24,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text(
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
                        const SizedBox(height: 4),
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredItems.length,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                "Features Items",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
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
                        onTap: () =>
                            context.read<AppCubit>().toggleListView(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: state.isListView
                                ? Colors.red
                                : Colors.red.shade50,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'List View',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: state.isListView
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
                        onTap: () =>
                            context.read<AppCubit>().toggleListView(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: state.isListView
                                ? Colors.red.shade50
                                : Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Grid View',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: state.isListView
                                    ? Colors.grey
                                    : Colors.white,
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
                child: filteredItems.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off,
                                size: 48, color: Colors.grey[400]),
                            const SizedBox(height: 8),
                            Text(
                              state.searchQuery.isEmpty
                                  ? 'No items'
                                  : 'No results for "${state.searchQuery}"',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      )
                    : state.isListView
                        ? ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                      product: filteredItems[index]),
                                ),
                              );
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
                                          filteredItems[index].image,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    margin: const EdgeInsets.only(bottom: 4),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 140,
                                    child: ListTile(
                                      title: Text(
                                        filteredItems[index].name,
                                        style: const TextStyle(fontSize: 16),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        filteredItems[index].desc,
                                        style: const TextStyle(fontSize: 14),
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
                                        context
                                            .read<AppCubit>()
                                            .addToCart(filteredItems[index]);
                                      },
                                      child: const Text(
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
                        itemCount: filteredItems.length,
                      )
                        : GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 200,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                      product: filteredItems[index]),
                                ),
                              );
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
                                          filteredItems[index].image,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      filteredItems[index].name,
                                      style: const TextStyle(fontSize: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      filteredItems[index].desc,
                                      style: const TextStyle(fontSize: 10),
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
                                        context
                                            .read<AppCubit>()
                                            .addToCart(filteredItems[index]);
                                      },
                                      child: const Text(
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
                        itemCount: filteredItems.length,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
