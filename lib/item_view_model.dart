import 'package:flutter/material.dart';
import 'item_model.dart';
import 'api_service.dart';

class ItemViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Item> items = [];
  bool isLoading = false;
  String errorMessage = '';
  String searchQuery = '';

  List<Item> get filteredItems => items
      .where((i) =>
          i.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          i.description.toLowerCase().contains(searchQuery.toLowerCase()))
      .toList();

  Future<void> fetchItems() async {
    isLoading = true;
    notifyListeners();
    try {
      items = await _apiService.fetchItems();
      errorMessage = '';
    } catch (e) {
      errorMessage = 'Failed to fetch data from API';
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addItem(Item item) async {
    final newItem = await _apiService.createItem(item);
    items.insert(0, newItem);
    notifyListeners();
  }

  Future<void> updateItem(String id, Item updated) async {
    await _apiService.updateItem(id, updated);
    final index = items.indexWhere((item) => item.id == id);
    if (index != -1) {
      items[index] = updated;
      notifyListeners();
    }
  }

  Future<void> deleteItem(String id) async {
    await _apiService.deleteItem(id);
    items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateSearch(String query) {
    searchQuery = query;
    notifyListeners();
  }
}
