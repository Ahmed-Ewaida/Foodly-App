import 'package:foodly/data.dart';

/// State واحدة شايلة كل داتا الـ app، بتتغير بـ copyWith فقط.
class AppState {
  final int selectedIndex;
  final List<CartItem> cartItems;
  final bool isListView;
  final List<String> descriptionExpandedProductNames;
  final String searchQuery;
  final List<String> favoriteProductNames;

  const AppState({
    this.selectedIndex = 0,
    this.cartItems = const [],
    this.isListView = true,
    this.descriptionExpandedProductNames = const [],
    this.searchQuery = '',
    this.favoriteProductNames = const [],
  });

  bool isFavorite(ProductItems product) =>
      favoriteProductNames.contains(product.name);

  bool isDescriptionExpanded(ProductItems product) =>
      descriptionExpandedProductNames.contains(product.name);

  AppState copyWith({
    int? selectedIndex,
    List<CartItem>? cartItems,
    bool? isListView,
    List<String>? descriptionExpandedProductNames,
    String? searchQuery,
    List<String>? favoriteProductNames,
  }) {
    return AppState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      cartItems: cartItems ?? this.cartItems,
      isListView: isListView ?? this.isListView,
      descriptionExpandedProductNames: descriptionExpandedProductNames ??
          this.descriptionExpandedProductNames,
      searchQuery: searchQuery ?? this.searchQuery,
      favoriteProductNames:
          favoriteProductNames ?? this.favoriteProductNames,
    );
  }
}
