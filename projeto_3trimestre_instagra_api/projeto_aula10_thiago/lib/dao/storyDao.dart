
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_aula10_thiago/models/story.dart';

class StoryDao {
  StoryDao._();
  static final StoryDao instance = StoryDao._();

  // Emulador Android: 10.0.2.2
  // Celular físico: IP do computador
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // READ - Buscar stories
  Future<List<Story>> getStories() async {
    final response = await http.get(
      Uri.parse('$baseUrl/stories'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> lista = jsonDecode(response.body);

      return lista.map((item) => Story.fromMap(item)).toList();
    }

    throw Exception(
      'Erro ao buscar stories: ${response.statusCode}',
    );
  }

  // CREATE - Adicionar story
  Future<int> add(Story newStory) async {
    final response = await http.post(
      Uri.parse('$baseUrl/stories'),
      headers: _headers,
      body: jsonEncode(newStory.toMap()),
    );

    if (response.statusCode == 201) {
      return Story.fromMap(jsonDecode(response.body)).id!;
    }

    throw Exception(
      'Erro ao criar story: ${response.statusCode}',
    );
  }

  // UPDATE - Atualizar story
  Future<void> update(Story story) async {
    final response = await http.put(
      Uri.parse('$baseUrl/stories/${story.id}'),
      headers: _headers,
      body: jsonEncode(story.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Erro ao atualizar story: ${response.statusCode}',
      );
    }
  }

  // DELETE - Remover story
  Future<void> remove(Story story) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/stories/${story.id}'),
      headers: _headers,
    );

    if (response.statusCode != 204) {
      throw Exception(
        'Erro ao remover story: ${response.statusCode}',
      );
    }
  }
}
