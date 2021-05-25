import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  print('Function execution started');
  var env = Platform.environment;
  final url = env['WEBHOOK_URL'] ?? '';
  final data = env['APPWRITE_FUNCTION_EVENT_DATA'];

  await http.post(
    Uri.parse(url),
    headers: {'content-type': 'application/json'},
    body: jsonEncode(
        {'content': 'New user just signed up. \n${data.toString()}'}),
  );
  print('notification sent successfully');
}
