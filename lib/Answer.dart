import 'dart:math';

class Answer {
  final Random _random = Random();

  String getResponse(String inputRaw) {
    final input = inputRaw.toLowerCase().trim().replaceAll('?', '');

    if (input.contains('temperature')) {
      final options = [
        'The temperature is 16 degrees',
        'Currently it\'s 16°C',
        ' We\'re seeing a consistent 16 degrees',
      ];
      return _randomChoice(options);
    } else if (input.contains('location')) {
      final options = [
        'Right now we are in Sonderborg',
        'We are currently located in Sønderborg',
        'GPS shows Sonderborg',
      ];
      return _randomChoice(options);
    } else if (input.contains('report') || input.contains('raport')) {
      final options = [
        'Stable conditions but King Julian is having a party',
        'All systems are stable. King Julian is celebrating.',
        'Everything\'s under control, King Julian is dancing.',
      ];
      return _randomChoice(options);
    } else if (input.contains('plans') || input.contains('secret')) {
      final options = [
        'Classified plans are in "Coming back to Denmark"',
        'You can find the plans under "Coming back to Denmark"',
        'Plans are top secret. Check "Coming back to Denmark"',
      ];
      return _randomChoice(options);}
      else if (input.contains('hello') || input.contains('hi') || input.contains('good morning')) {
      final options = [
        'Hi, what do you want to know?',
        'Hello,it was a long night! What do you want me to tell you?',
        'Good morning! Such a wonderful day. What do you want to know about?',
      ];
      return _randomChoice(options);

    } else {
      return 'I didn’t quite get that. Try asking about temperature, location, plans or a report.';
    }
  }

  String _randomChoice(List<String> options) {
    return options[_random.nextInt(options.length)];
  }
}
