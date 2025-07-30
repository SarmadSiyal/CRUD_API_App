import 'dart:convert';
import 'package:http/http.dart' as http;
import 'item_model.dart';

class ApiService {
  final String baseUrl = 'https://6888e92cadf0e59551bbe434.mockapi.io/items';

  Future<List<Item>> fetchItems() async {
    final res = await http.get(Uri.parse(baseUrl));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => Item.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch items');
    }
  }

  Future<Item> createItem(Item item) async {
    final res = await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode(item.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (res.statusCode == 201) {
      return Item.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<void> updateItem(String id, Item item) async {
    final res = await http.put(
      Uri.parse('$baseUrl/$id'),
      body: jsonEncode(item.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (res.statusCode != 200) {
      throw Exception('Failed to update item');
    }
  }

  Future<void> deleteItem(String id) async {
    final res = await http.delete(Uri.parse('$baseUrl/$id'));
    if (res.statusCode != 200) {
      throw Exception('Failed to delete item');
    }
  }
}
