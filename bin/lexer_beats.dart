import 'package:lexer_beats/token/lexer_exception.dart';
import 'package:lexer_beats/token/token.dart';
import 'package:lexer_beats/token/tokenizer.dart';

void main() {
  final tokenizer = Tokenizer();

  tokenizer.add("TEMPO", Token.TEMPO);
  tokenizer.add("TRACK", Token.TRACK);
  tokenizer.add("PLAY", Token.PLAY);
  tokenizer.add("LOOP", Token.LOOP);
  tokenizer.add("GROUP", Token.GROUP);
  tokenizer.add("HIHAT_FT", Token.HIHAT_FT);
  tokenizer.add("TOMTOM", Token.TOMTOM);
  tokenizer.add("FLOORTOM", Token.FLOORTOM);
  tokenizer.add("RIDE", Token.RIDE);
  tokenizer.add("HIHAT", Token.HIHAT);
  tokenizer.add("SNARE", Token.SNARE);
  tokenizer.add("KICK", Token.KICK);
  tokenizer.add(r'\{', Token.OPEN_BRACKET);
  tokenizer.add(r'\}', Token.CLOSE_BRACKET);
  tokenizer.add(r'\:', Token.COLON);
  tokenizer.add(r'[0-9]+', Token.NUMBER);
  tokenizer.add(r'[a-zA-Z][a-zA-Z0-9_]*', Token.VARIABLE);

  try {
    tokenizer.tokenize("""
    TEMPO 120
    
    TRACK Base1 {
      1: KICK
      2: SNARE
      3: HIHAT
      4: KICK
    }
    
    TRACK Base2 {
      1: RIDE
      2: HIHAT_FT
      3: TOMTOM
      4: FLOORTOM
    }
    
    GROUP Ritmo {
      Base1
      Base2
    }
    
    LOOP 2 {
      PLAY Ritmo
    }
    """);

    print('\n=========TOKEN LIST==========\n');

    for (final tok in tokenizer.tokens) {
      print('[Token:${tok.token} Lexema:${tok.lexeme} Posicion:${tok.pos}]');
    }
  } on LexerException catch (e) {
    print(e.message);
  }
}