import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestHandler{

  

   final String baseUrl;
   RequestHandler({required this.baseUrl});


///Function to send commands - tunring LEDs on and off 
   Future<Map<String, dynamic>> sendLedCommand(String color, String state) async {
    print('Request entered');
    //creating the URL
    final url = Uri.parse('$baseUrl/led/$color?state=$state');
    print(url.toString());

  // waiting for what is going on
    final response = await http.post(url);

//success of response 
    if (response.statusCode == 200) {
      print('Code 200 received');
      return jsonDecode(response.body);
    } else {
      print('Error');
      //if not
      throw Exception('Failed to control LED. Status: ${response.statusCode}'); //404 or 400
    }
  }








}