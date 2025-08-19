class Token {
  static const int TEMPO = 0;
  static const int TRACK = 1;
  static const int PLAY = 2;
  static const int LOOP = 3;
  static const int GROUP = 4;
  static const int HIHAT_FT = 5;
  static const int TOMTOM = 6;
  static const int FLOORTOM = 7;
  static const int RIDE = 8;
  static const int HIHAT = 9;
  static const int SNARE = 10;
  static const int KICK = 11;
  static const int OPEN_BRACKET = 12;
  static const int CLOSE_BRACKET = 13;
  static const int COLON = 14;
  static const int NUMBER = 15;
  static const int VARIABLE = 16;


  final int token;
  final String lexeme;
  final int pos;

  Token(this.token, this.lexeme, this.pos);

  Token clone() {
    return Token(token, lexeme, pos);
  }
}