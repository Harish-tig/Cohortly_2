import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  ChatUser myself = ChatUser(id: '1', firstName: 'Sudheesh');
  ChatUser bot = ChatUser(id: '2', firstName: 'Gemini');

  List<ChatMessage> allmessages = [];
  List<ChatUser> typing = [];

  getData(ChatMessage m) async {
    typing.add(bot);
    allmessages.insert(0, m);
    setState(() {});

    final generationConfig = GenerationConfig(
      maxOutputTokens: 500,
      temperature: 0.9,
      topP: 0.1,
      topK: 16,
    );

    var data = m.text;
    final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: 'AIzaSyBKMv5nKYmaT6_fT7OGNfv8kFx2APBj0QA',
        generationConfig: generationConfig);
    final content = [Content.text(data)];
    final response = await model.generateContent(content);

    ChatMessage m1 = ChatMessage(
        text: response.text.toString(), user: bot, createdAt: DateTime.now());

    allmessages.insert(0, m1);
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF26A69A),
        title: Row(
          children: [
            Icon(Icons.account_circle_outlined),
            SizedBox(width: 8),
            Text(
              'Chat with Gemini',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black), // Define border properties

        ),
        child: DashChat(
          typingUsers: typing,
          currentUser: myself,
          onSend: (ChatMessage m) {
            getData(m);
          },
          messages: allmessages,
        ),
      ),
    );
  }
}
