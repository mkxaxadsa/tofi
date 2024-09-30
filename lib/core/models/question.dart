import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class Question {
  final String question;
  final List<Answer> answers;

  Question({
    required this.question,
    required this.answers,
  });
}

class Answer {
  final String answer;
  final bool correct;
  Color color;

  Answer({
    required this.answer,
    required this.correct,
    this.color = AppColors.card2,
  });
}

List<Question> questionsList = [
  Question(
    question: 'What does APR stand for?',
    answers: [
      Answer(answer: 'Annual Payment Rate', correct: false),
      Answer(answer: 'Annual Percentage Rate', correct: true),
      Answer(answer: 'Average Principal Return', correct: false),
      Answer(answer: 'All Payments Required', correct: false),
    ],
  ),
  Question(
    question: 'Which investment carries the highest risk?',
    answers: [
      Answer(answer: 'Treasury bonds', correct: false),
      Answer(answer: 'Blue-chip stocks', correct: false),
      Answer(answer: 'Municipal bonds', correct: false),
      Answer(answer: 'Penny stocks', correct: true),
    ],
  ),
  Question(
    question: 'What is the purpose of diversification in investing?',
    answers: [
      Answer(answer: 'To reduce investment costs', correct: false),
      Answer(answer: 'To increase tax benefits', correct: false),
      Answer(answer: 'To spread risk', correct: true),
      Answer(answer: 'To maximize returns', correct: false),
    ],
  ),
  Question(
    question: 'What is a \'401(k)?\'',
    answers: [
      Answer(answer: 'A type of mortgage', correct: false),
      Answer(answer: 'An individual retirement account', correct: false),
      Answer(answer: 'A savings bond', correct: false),
      Answer(answer: 'A workplace retirement plan', correct: true),
    ],
  ),
  Question(
    question: 'What does ROI stand for?',
    answers: [
      Answer(answer: 'Return on Investment', correct: true),
      Answer(answer: 'Rate of Interest', correct: false),
      Answer(answer: 'Risk of Inflation', correct: false),
      Answer(answer: 'Revenue Over Inflation', correct: false),
    ],
  ),
  Question(
    question:
        'Which type of insurance is typically required by law in most states for drivers?',
    answers: [
      Answer(answer: 'Health insurance', correct: false),
      Answer(answer: 'Disability insurance', correct: false),
      Answer(answer: 'Home insurance', correct: false),
      Answer(answer: 'Car insurance', correct: true),
    ],
  ),
  Question(
    question: 'What is the \'prime rate\' used for?',
    answers: [
      Answer(answer: 'Setting mortgage rates', correct: false),
      Answer(answer: 'Determining credit card interest rates', correct: true),
      Answer(answer: 'Calculating stock dividends', correct: false),
      Answer(answer: 'Establishing savings account rates', correct: false),
    ],
  ),
  Question(
    question: 'What is a \'bull market\'?',
    answers: [
      Answer(answer: 'When prices are falling', correct: false),
      Answer(answer: 'When prices are rising', correct: true),
      Answer(answer: 'When prices are stable', correct: false),
      Answer(answer: 'When prices are fluctuating', correct: false),
    ],
  ),
  Question(
    question: 'Which of the following is a form of passive income?',
    answers: [
      Answer(answer: 'Wages from a job', correct: false),
      Answer(answer: 'Dividends from stocks', correct: true),
      Answer(answer: 'Savings account interest', correct: false),
      Answer(answer: 'Profit from selling a car', correct: false),
    ],
  ),
  Question(
    question: 'What is the purpose of a budget?',
    answers: [
      Answer(answer: 'To track income', correct: false),
      Answer(answer: 'To limit spending', correct: false),
      Answer(answer: 'To plan for expenses', correct: false),
      Answer(answer: 'All of the above', correct: true),
    ],
  ),
  Question(
    question: 'Which of the following is NOT a type of credit score?',
    answers: [
      Answer(answer: 'FICO Score', correct: false),
      Answer(answer: 'VantageScore', correct: false),
      Answer(answer: 'TransUnion Score', correct: true),
      Answer(answer: 'Equifax Score', correct: false),
    ],
  ),
  Question(
    question: 'What does \'APY\' stand for in finance?',
    answers: [
      Answer(answer: 'Annual Payment Yield', correct: false),
      Answer(answer: 'Average Principal Yen', correct: false),
      Answer(answer: 'Annual Percentage Yield', correct: true),
      Answer(answer: 'All Principal Yields', correct: false),
    ],
  ),
  Question(
    question: 'What is the purpose of a stock split?',
    answers: [
      Answer(answer: 'To increase the price per share', correct: false),
      Answer(
          answer: 'To decrease the number of outstanding shares',
          correct: false),
      Answer(answer: 'To decrease the price per share', correct: true),
      Answer(
          answer: 'To increase the number of outstanding shares',
          correct: false),
    ],
  ),
  Question(
    question: 'What does ETF stand for?',
    answers: [
      Answer(answer: 'Electronic Transfer Fund', correct: false),
      Answer(answer: 'Exchange-Traded Fund', correct: true),
      Answer(answer: 'Equity Trading Fund', correct: false),
      Answer(answer: 'Efficient Transaction Fund', correct: false),
    ],
  ),
  Question(
    question: 'Which of the following is an example of a liquid asset?',
    answers: [
      Answer(answer: 'Real estate', correct: false),
      Answer(answer: 'Gold bars', correct: false),
      Answer(answer: 'Savings account', correct: true),
      Answer(answer: 'Antique furniture', correct: false),
    ],
  ),
  Question(
    question: 'What does IRA stand for in finance?',
    answers: [
      Answer(answer: 'Individual Retirement Account', correct: true),
      Answer(answer: 'International Revenue Account', correct: false),
      Answer(answer: 'Investment Return Assessment', correct: false),
      Answer(answer: 'Insurance Regulatory Authority', correct: false),
    ],
  ),
  Question(
    question: 'Which of the following is a characteristic of a bear market?',
    answers: [
      Answer(answer: 'Rising stock prices', correct: false),
      Answer(answer: 'Investor optimism', correct: false),
      Answer(answer: 'Declining stock prices', correct: true),
      Answer(answer: 'Low volatility', correct: false),
    ],
  ),
  Question(
    question: 'What is the purpose of an emergency fund?',
    answers: [
      Answer(answer: 'To save for vacations', correct: false),
      Answer(answer: 'To cover unexpected expenses', correct: true),
      Answer(answer: 'To invest in stocks', correct: false),
      Answer(answer: 'To pay off debts', correct: false),
    ],
  ),
  Question(
    question:
        'Which of the following is a type of retirement account that offers tax advantages?',
    answers: [
      Answer(answer: 'Checking account', correct: false),
      Answer(answer: 'Brokerage account', correct: false),
      Answer(answer: 'Savings account', correct: false),
      Answer(answer: 'Roth IRA', correct: true),
    ],
  ),
  Question(
    question: 'What does \'compound interest\' mean?',
    answers: [
      Answer(
          answer: 'Interest calculated only on the principal', correct: false),
      Answer(
          answer:
              'Interest calculated on the principal plus any interest earned',
          correct: true),
      Answer(answer: 'Interest paid in installments', correct: false),
      Answer(answer: 'Interest earned from dividends', correct: false),
    ],
  ),
];
