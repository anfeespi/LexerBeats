class Token {
  static const int tempo = 0;
  static const int track = 1;
  static const int play = 2;
  static const int loop = 3;
  static const int group = 4;
  static const int hithatFt = 5;
  static const int tomtom = 6;
  static const int floorTom = 7;
  static const int ride = 8;
  static const int hihat = 9;
  static const int snare = 10;
  static const int kick = 11;
  static const int openBracket = 12;
  static const int closeBracket = 13;
  static const int colon = 14;
  static const int number = 15;
  static const int variable = 16;


  final int token;
  final String lexeme;
  final int pos;

  Token(this.token, this.lexeme, this.pos);

  Token clone() {
    return Token(token, lexeme, pos);
  }
}