import 'package:finance27/core/widgets/buttons/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/question.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_r.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int correct = 0;
  bool canTap = true;
  bool last = false;

  void onAnswer(Answer value) {
    canTap = false;
    if (value.correct) {
      correct++;
      value.color = AppColors.main;
    } else {
      value.color = Colors.redAccent;
    }
    setState(() {});
    Future.delayed(const Duration(seconds: 1), () {
      canTap = true;
      setState(() {
        value.color = AppColors.card2;
        logger(questionsList.length);
        if (index + 1 < questionsList.length) {
          index++;
        } else {
          logger('LAST');
          last = true;
        }
      });
    });
  }

  void onRestart() {
    setState(() {
      last = false;
      correct = 0;
      index = 0;
      canTap = true;
      shuffleAnswers();
    });
  }

  void shuffleAnswers() {
    questionsList.shuffle();
    for (Question question in questionsList) {
      question.answers.shuffle();
    }
  }

  @override
  void initState() {
    super.initState();

    shuffleAnswers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 80 + getStatusBar(context)),
          if (last) ...[
            Center(
              child: TextM(
                'Correct answers: $correct',
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              title: 'Restart',
              width: 200,
              onPressed: onRestart,
            ),
          ] else ...[
            Center(
              child: TextR(
                'Question ${index + 1} out of 20',
                fontSize: 16,
                color: AppColors.white50,
              ),
            ),
            SizedBox(
              height: 230,
              child: Center(
                child: TextB(
                  questionsList[index].question,
                  fontSize: 32,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            _AnswerCard(
              index: 'A',
              answer: questionsList[index].answers[0],
              canTap: canTap,
              onPressed: onAnswer,
            ),
            const SizedBox(height: 37),
            _AnswerCard(
              index: 'B',
              answer: questionsList[index].answers[1],
              canTap: canTap,
              onPressed: onAnswer,
            ),
            const SizedBox(height: 37),
            _AnswerCard(
              index: 'C',
              answer: questionsList[index].answers[2],
              canTap: canTap,
              onPressed: onAnswer,
            ),
            const SizedBox(height: 37),
            _AnswerCard(
              index: 'D',
              answer: questionsList[index].answers[3],
              canTap: canTap,
              onPressed: onAnswer,
            ),
          ],
        ],
      ),
    );
  }
}

class _AnswerCard extends StatelessWidget {
  const _AnswerCard({
    required this.index,
    required this.answer,
    required this.canTap,
    required this.onPressed,
  });

  final String index;
  final Answer answer;
  final bool canTap;
  final void Function(Answer) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 48,
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: answer.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: canTap
            ? () {
                onPressed(answer);
              }
            : null,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: TextB(
                index,
                fontSize: 16,
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextR(
                answer.answer,
                maxLines: 2,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
