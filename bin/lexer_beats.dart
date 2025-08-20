import 'package:lexer_beats/token/comment_remover.dart';
import 'package:lexer_beats/token/lexer_exception.dart';
import 'package:lexer_beats/token/token.dart';
import 'package:lexer_beats/token/tokenizer.dart';

void main() {
  final tokenizer = Tokenizer();

  tokenizer.add("TEMPO", Token.tempo);
  tokenizer.add("TRACK", Token.track);
  tokenizer.add("PLAY", Token.play);
  tokenizer.add("LOOP", Token.loop);
  tokenizer.add("GROUP", Token.group);
  tokenizer.add("HIHAT_FT", Token.hithatFt);
  tokenizer.add("TOMTOM", Token.tomtom);
  tokenizer.add("FLOORTOM", Token.floorTom);
  tokenizer.add("RIDE", Token.ride);
  tokenizer.add("HIHAT", Token.hihat);
  tokenizer.add("SNARE", Token.snare);
  tokenizer.add("KICK", Token.kick);
  tokenizer.add(r'\{', Token.openBracket);
  tokenizer.add(r'\}', Token.closeBracket);
  tokenizer.add(r'\:', Token.colon);
  tokenizer.add(r'[0-9]+', Token.number);
  tokenizer.add(r'[a-zA-Z][a-zA-Z0-9_]*', Token.variable);

  try {
    String cleanedInput = CommentRemover.removeComments("""
        TEMPO 120
        // This is a comment
        /* This is a
          multi-line comment
        */
        TRACK Base1 {
          1: KICK
          2: SNARE
          3: HIHAT
          4: KICK // Another comment
        }
        
        TRACK Base2 {
          1: RIDE
          2: HIHAT_FT
          3: TOMTOM
          4: FLOORTOM
        }
        /* This is a
          multi-line comment
        */
        GROUP Ritmo { // This is a group comment
          Base1
          Base2
        }
        
        
        LOOP 2 {
          PLAY Ritmo
        }
      """);
    print(cleanedInput);
    tokenizer.tokenize(cleanedInput);

    print('\n=========TOKEN LIST==========\n');

    for (final tok in tokenizer.tokens) {
      print('[Token:${tok.token} Lexema:${tok.lexeme} Posicion:${tok.pos}]');
    }
  } on LexerException catch (e) {
    print(e.message);
  }
}
