import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_aula10_thiago/models/post.dart';

class PostDao {
  PostDao._();
  static final PostDao instance = PostDao._();

  // Emulador Android: 10.0.2.2 | Celular físico: IP do PC (ex.: 192.168.0.10)
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // R
  Future<List<Post>> getPosts() async {
    final response =
        await http.get(Uri.parse('$baseUrl/posts'), headers: _headers);

    if (response.statusCode == 200) {
      final List<dynamic> lista = jsonDecode(response.body);
      return lista.map((item) => Post.fromMap(item)).toList();
    }
    throw Exception('Erro ao buscar posts: ${response.statusCode}');
  }

  // C
  Future<int> add(Post newPost) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: _headers,
      body: jsonEncode(newPost.toMap()),
    );

    if (response.statusCode == 201) {
      return Post.fromMap(jsonDecode(response.body)).id!;
    }
    throw Exception('Erro ao criar post: ${response.statusCode}');
  }

  // U
  Future<void> update(Post post) async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/${post.id}'),
      headers: _headers,
      body: jsonEncode(post.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar post: ${response.statusCode}');
    }
  }

  // D
  Future<void> remove(Post post) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/posts/${post.id}'),
      headers: _headers,
    );

    if (response.statusCode != 204) {
      throw Exception('Erro ao remover post: ${response.statusCode}');
    }
  }
}