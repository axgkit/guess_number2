import 'dart:io';
import 'game.dart';

// top-level function
void main(){

  var result = 0;
  var myList = <int>[];
  int count = 0;

  do {
    count = 0;
    stdout.write('˃ Enter a maximum number to random: ');

    var maxiNumber = stdin.readLineSync();
    var tryMaxiNumber = int.tryParse(maxiNumber!);

    print('┌────────────────────────────────────────────');
    print('│             GUESS THE NUMBER            ');
    print('│────────────────────────────────────────────');

    if (tryMaxiNumber == null) {
      var game = Game();
      do {
        stdout.write('│ Please guess the number between 1 and 100: ');

        var input = stdin.readLineSync();
        var guess = int.tryParse(input!);

        if (guess == null) {
          stdout.write('│ Please Enter Number Only');
          continue;
        }
        result = game.doGuess(guess);
        count += 1;

      }while(result != 1);

    } else {
      var game = Game(maxRandom: tryMaxiNumber);
      do {
        stdout.write('│ Please guess the number between 1 and $tryMaxiNumber: ');

        var input = stdin.readLineSync();
        var guess = int.tryParse(input!);

        if (guess == null) {
          print('│ Please Enter Number Only');
          continue;
        }
        result = game.doGuess(guess);
        count += 1;

      }while(result != 1);
    }
    var flag = false;

    if(result == 1) {
      do {
        stdout.write('Play again (y/n) : ');
        var choice = stdin.readLineSync();

        if (choice == 'n' || choice == 'N') {
          myList.add(count);
          break;

        } else if (choice == 'y' || choice == 'Y') {
          myList.add(count);
          result = 0;
          flag = true;
        }
      }while (!flag);
    }

  } while(result != 1);

  var rounds = myList.length;
  print('★ You’ve played $rounds games');

  for(var i = 0; i < myList.length; i++){
    print('★ Game #${i+1}: ${myList[i]} guesses');
  }
}