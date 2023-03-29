import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main(){
  runApp(MaterialApp(home: TextGenerator()));
}
class TextGenerator extends StatefulWidget {
  const TextGenerator({Key? key}) : super(key: key);

  @override
  _TextGeneratorState createState() => _TextGeneratorState();
}

class _TextGeneratorState extends State<TextGenerator> {
  final _controller = TextEditingController();
  String _generatedText = '';

  Future<void> _generateText(String prompt) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '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',
      },
      body: jsonEncode({
        'prompt': prompt,
        'max_tokens': 100,
        'temperature': 0.5,
        'n': 1,
        'stop': ['\n']
      }),
    );

    final data = jsonDecode(response.body)['choices'][0]['text'];
    setState(() {
      _generatedText = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Generator'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter prompt here',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(" Clciked");
              _generateText(_controller.text);
            },
            child: Text('Generate Text'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Text(_generatedText),
            ),
          ),
        ],
      ),
    );
  }
}
