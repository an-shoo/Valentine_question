import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink.shade400,
        scaffoldBackgroundColor: Colors.pink.shade100,
      ),
      home: Page(),
    );
  }
}

class Page extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final noCount = useState(0);
    final yesPressed = useState(false);
    final yesButtonSize = noCount.value * 20.0 + 16.0;

    void handleNoClick() {
      noCount.value = noCount.value + 1;
    }

    String getNoButtonText() {
      final phrases = [
        "No",
        "Are you sure?",
        "Really sure?",
        "Think again!",
        "Last chance!",
        "Surely not?",
        "You might regret this!",
        "Give it another thought!",
        "Are you absolutely certain?",
        "This could be a mistake!",
        "Have a heart!",
        "Don't be so cold!",
        "Change of heart?",
        "Wouldn't you reconsider?",
        "Is that your final answer?",
        "You're breaking my heart ;(",
      ];

      return phrases[noCount.value.clamp(0, phrases.length - 1)];
    }

    return Scaffold(
      body: Center(
        child: yesPressed.value
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      'https://media.tenor.com/gUiu1zyxfzYAAAAi/bear-kiss-bear-kisses.gif'),
                  Text(
                    'Okies yay!!!',
                    style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold,color: Colors.pink.shade900),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://media.tenor.com/p96XUHeS4q8AAAAi/peach-and-goma-goma.gif',
                    height: 200,
                  ),
                  Text(
                    'Will you be my Valentine?',
                    style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold,color: Colors.pink.shade900),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[500],
                          onPrimary: Colors.white,
                          textStyle: TextStyle(fontSize: yesButtonSize),
                        ),
                        onPressed: () => yesPressed.value = true,
                        child: Text('Yes'),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[500],
                          onPrimary: Colors.white,
                        ),
                        onPressed: handleNoClick,
                        child: Text(
                          noCount.value == 0 ? 'No' : getNoButtonText(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
