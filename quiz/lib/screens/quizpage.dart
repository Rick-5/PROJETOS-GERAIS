import 'package:flutter/material.dart';
import 'finalpage.dart';
import 'dart:async';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestion = 0;
  int _score = 0;
  bool _isQuizEnded = false;
  Timer? _timer;
  int _secondsLeft = 15;



  final List<Color> _rainbowColors = [
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.cyan,
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.pink,
  ];

  final List<Map<String, Object>> _questions = [
    {
      'question': '🌍 Qual é o maior planeta do nosso sistema solar?',
      'type': 'normal',
      'image': 'assets/images/espaco.jpg',
      'answers': [
        {'text': 'Terra', 'score': 0},
        {'text': 'Júpiter', 'score': 3},
        {'text': 'Urano', 'score': 2},
        {'text': 'Saturno', 'score': 1},
      ],
    },
    {
      'question': '⚡ Qual é o elemento químico mais abundante no corpo humano?',
      'type': 'normal',
      'image': 'assets/images/quimica.jpg',
      'answers': [
        {'text': 'Oxigênio', 'score': 3},
        {'text': 'Carbono', 'score': 0},
        {'text': 'Hidrogênio', 'score': 0},
        {'text': 'Nitrogênio', 'score': 0},
      ],
    },
    {
      'question': '🌍 Qual é o continente onde vive a maior parte da população mundial?',
      'type': 'normal',
      'image': 'assets/images/mapa.jpg',
      'answers': [
        {'text': 'África', 'score': 0},
        {'text': 'Ásia', 'score': 3},
        {'text': 'Europa', 'score': 0},
        {'text': 'América', 'score': 0},
      ],
    },
    {
      'question': '🍕 Qual é o prato italiano mais famoso no mundo?',
      'type': 'normal',
      'image': 'assets/images/food.jpg',
      'answers': [
        {'text': 'Pizza', 'score': 3},
        {'text': 'Lasanha', 'score': 1},
        {'text': 'Risoto', 'score': 0},
        {'text': 'Espaguete', 'score': 0},
      ],
    },
    {
      'question': '🇮🇹 Qual cidade italiana é famosa por sua torre inclinada?',
      'type': 'normal',
      'image': 'assets/images/italia.jpg',
      'answers': [
        {'text': 'Roma', 'score': 0},
        {'text': 'Florença', 'score': 0},
        {'text': 'Veneza', 'score': 0},
        {'text': 'Pisa', 'score': 3},
      ],
    },
    {
      'question': '🎶 Quem é o "Rei do Pop"?',
      'type': 'normal',
      'image': 'assets/images/music.jpg',
      'answers': [
        {'text': 'Michael Jackson', 'score': 3},
        {'text': 'Elvis Presley', 'score': 0},
        {'text': 'Freddie Mercury', 'score': 0},
        {'text': 'Prince', 'score': 0},
      ],
    },
    {
      'question': '🌌 Qual é o nome da maior lua de Saturno?',
      'type': 'normal',
      'image': 'assets/images/saturn.jpg',
      'answers': [
        {'text': 'Titan', 'score': 3},
        {'text': 'Encélado', 'score': 0},
        {'text': 'Rhea', 'score': 0},
        {'text': 'Mimas', 'score': 0},
      ],
    },
    {
      'question': '⏳ Em 10 segundos, quem foi o primeiro imperador de Roma?',
      'type': 'timed',
      'image': 'assets/images/roma.jpg',
      'answers': [
        {'text': 'Júlio César', 'score': 0},
        {'text': 'Augusto', 'score': 3},
        {'text': 'Nero', 'score': 0},
        {'text': 'Trajano', 'score': 0},
      ],
    },
    {
      'question': '🍫 Quem inventou o chocolate?',
      'type': 'normal',
      'image': 'assets/images/choco.jpg',
      'answers': [
        {'text': 'Os Maias', 'score': 3},
        {'text': 'Os Egípcios', 'score': 0},
        {'text': 'Os Gregos', 'score': 0},
        {'text': 'Os Romanos', 'score': 0},
      ],
    },
    {
      'question': '🚀 Em que ano o homem pisou na Lua pela primeira vez?',
      'type': 'normal',
      'image': 'assets/images/lua.jpg',
      'answers': [
        {'text': '1965', 'score': 0},
        {'text': '1969', 'score': 3},
        {'text': '1972', 'score': 0},
        {'text': '1975', 'score': 0},
      ],
    },
 
  ];

 void _startTimer() {
    _timer?.cancel();
    _secondsLeft = 15;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsLeft > 0) {
          _secondsLeft--;
        } else {
          timer.cancel();
          _answerQuestion(0);
        }
      });
    });
  }

  void _endQuiz() {
    setState(() {
      _isQuizEnded = true;
    });
  }

  void _answerQuestion(int score) {
    _timer?.cancel();

    setState(() {
      _score += score;
      _currentQuestion++;

      if (_currentQuestion >= _questions.length) {
        _endQuiz();
      } else {
        _startTimer();
      }
    });
  }

  void _resetQuiz() {
    _timer?.cancel();
    setState(() {
      _isQuizEnded = false;
      _score = 0;
      _currentQuestion = 0;
      _startTimer();
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isQuizEnded || _currentQuestion >= _questions.length
              ? 'Quiz Finalizado'
              : (_questions[_currentQuestion]['question'] as String? ?? ''),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: _isQuizEnded
                ? Container()
                : Image.asset(
                    _questions[_currentQuestion]['image'] as String,
                    fit: BoxFit.cover,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: _isQuizEnded
                ? FinalScreen(score: _score, resetQuiz: _resetQuiz)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            '⏱️ Tempo restante: $_secondsLeft s',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2
                                ..color = Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '⏱️ Tempo restante: $_secondsLeft s',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ...(_questions[_currentQuestion]['answers']
                              as List<Map<String, Object>>)
                          .asMap()
                          .entries
                          .map((entry) {
                        final i = entry.key;
                        final answer = entry.value;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  _rainbowColors[i % _rainbowColors.length],
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              _answerQuestion(answer['score'] as int);
                            },
                            child: Text(
                              answer['text'] as String,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
          ),
          
          Positioned(
            bottom: 10,
            left: 570,
            right: 570,
            child: _isQuizEnded
                ? Container()
                : Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Pergunta ${_currentQuestion + 1} de ${_questions.length}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}