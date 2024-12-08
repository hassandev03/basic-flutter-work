import 'package:quiz_app/models/quiz_question.dart';

// first index is the correct answer
const questions = <QuizQuestion>[
  QuizQuestion(
    "What is Flutter?",
    <String>[
      "A cross-platform framework for building mobile, web, and desktop applications", // correct answer
      "A framework for building Android applications",
      "A programming language",
      "A database management tool",
    ],
  ),
  QuizQuestion(
    "What is the main programming language used by Flutter?",
    <String>[
      "Dart", // correct answer
      "Java",
      "Kotlin",
      "Swift",
    ],
  ),
  QuizQuestion(
    "Which company developed Flutter?",
    <String>[
      "Google", // correct answer
      "Apple",
      "Microsoft",
      "Meta",
    ],
  ),
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    <String>[
      'Widgets', // correct answer
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestion(
    'How are Flutter UIs built?',
    <String>[
      'By combining widgets in code', // correct answer
      'By combining widgets in a visual editor',
      'By defining widgets in config files',
      'By using XCode for iOS and Android Studio for Android',
    ],
  ),
  QuizQuestion(
    'What is the Scaffold widget used for in Flutter?',
    <String>[
      'To create a basic layout structure for the visual interface', // correct answer
      'To manage the app\'s lifecycle',
      'To handle state management',
      'To define the app\'s main theme',
    ],
  ),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    <String>[
      'Update UI as data changes', // correct answer
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    <String>[
      'StatelessWidget', // correct answer
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    <String>[
      'The UI is not updated', // correct answer
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    <String>[
      'By calling setState()', // correct answer
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
  QuizQuestion(
    'What is the purpose of the build() method?',
    <String>[
      'To build the UI', // correct answer
      'To define the UI',
      'To update the UI',
      'To render the UI',
    ],
  ),
  QuizQuestion(
    'Which widget is used to display a piece of text in Flutter?',
    <String>[
      'Text', // correct answer
      'String',
      'TextWidget',
      'StringWidget'
    ],
  ),
  QuizQuestion(
    'What is pubspec.yaml used for in a Flutter project?',
    <String>[
      "To manage project dependencies", // correct answer
      "To define routes in the app",
      "To configure database connections",
      "To store user credentials",
    ],
  ),
];
