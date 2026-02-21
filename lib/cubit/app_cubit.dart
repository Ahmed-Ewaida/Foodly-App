import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly/cubit/app_state.dart';
import 'package:foodly/data.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void setSelectedIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void toggleListView() {
    emit(state.copyWith(isListView: !state.isListView));
  }

  void toggleDescriptionExpanded(ProductItems product) {
    final names = List<String>.from(state.descriptionExpandedProductNames);
    if (names.contains(product.name)) {
      names.remove(product.name);
    } else {
      names.add(product.name);
    }
    emit(state.copyWith(descriptionExpandedProductNames: names));
  }

  void setSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query.trim()));
  }

  void clearSearch() {
    emit(state.copyWith(searchQuery: ''));
  }

  void toggleFavorite(ProductItems product) {
    final names = List<String>.from(state.favoriteProductNames);
    if (names.contains(product.name)) {
      names.remove(product.name);
    } else {
      names.add(product.name);
    }
    emit(state.copyWith(favoriteProductNames: names));
  }

  void addToCart(ProductItems product) {
    final items = List<CartItem>.from(state.cartItems);
    final existingIndex =
        items.indexWhere((item) => item.product.name == product.name);
    if (existingIndex >= 0) {
      items[existingIndex] =
          items[existingIndex].copyWith(quantity: items[existingIndex].quantity + 1);
    } else {
      items.add(CartItem(product: product));
    }
    emit(state.copyWith(cartItems: items));
  }

  void updateCartQuantity(int index, int delta) {
    final items = List<CartItem>.from(state.cartItems);
    if (index < 0 || index >= items.length) return;
    final current = items[index];
    final newQty = current.quantity + delta;
    if (newQty <= 0) {
      items.removeAt(index);
    } else {
      items[index] = current.copyWith(quantity: newQty);
    }
    emit(state.copyWith(cartItems: items));
  }

  void removeFromCart(int index) {
    final items = List<CartItem>.from(state.cartItems);
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      emit(state.copyWith(cartItems: items));
    }
  }
}
