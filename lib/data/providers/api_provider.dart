import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/job_post_model.dart';

class ApiProvider {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<JobPost>> getJobPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => JobPost.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load job posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load job posts: $e');
    }
  }

  Future<JobPost> getJobPostById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts/$id'));

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        return JobPost.fromJson(data);
      } else {
        throw Exception('Failed to load job post: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load job post: $e');
    }
  }
}
