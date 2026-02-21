import 'package:foodly/data.dart';

/// State واحدة شايلة كل داتا الـ app، بتتغير بـ copyWith فقط.
class AppState {
  final int selectedIndex;
  final List<CartItem> cartItems;
  final bool isListView;
  final bool isDescriptionExpanded;
  final String searchQuery;
  final List<String> favoriteProductNames;

  const AppState({
    this.selectedIndex = 0,
    this.cartItems = const [],
    this.isListView = true,
    this.isDescriptionExpanded = false,
    this.searchQuery = '',
    this.favoriteProductNames = const [],
  });

  bool isFavorite(ProductItems product) =>
      favoriteProductNames.contains(product.name);

  AppState copyWith({
    int? selectedIndex,
    List<CartItem>? cartItems,
    bool? isListView,
    bool? isDescriptionExpanded,
    String? searchQuery,
    List<String>? favoriteProductNames,
  }) {
    return AppState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      cartItems: cartItems ?? this.cartItems,
      isListView: isListView ?? this.isListView,
      isDescriptionExpanded:
          isDescriptionExpanded ?? this.isDescriptionExpanded,
      searchQuery: searchQuery ?? this.searchQuery,
      favoriteProductNames:
          favoriteProductNames ?? this.favoriteProductNames,
    );
  }
}
