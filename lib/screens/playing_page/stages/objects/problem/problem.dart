import 'dart:async';

import 'package:bitman_quest/game.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/ground_block.dart';
import 'package:bitman_quest/screens/playing_page/stages/block/grounds.dart';
import 'package:flame/components.dart';
import 'package:flutter/rendering.dart';


enum ProblemStatus{
  initial,solving,success
}
class Problem extends Component with HasGameRef<BitmanQuest> {
  Problem({
    required this.id,
    required this.problem,
    required this.answer ,
    this .status=ProblemStatus.initial,
    this.inputText = '',
    this.maxLength = 3});
  final String id;

  ProblemStatus status;

  final List<Component> problem;

  String inputText;
  final List<String> answer;
  final int maxLength;
  
  @override
  FutureOr<void> onLoad() async{
    await addAll(problem);
    return super.onLoad();
  }
  @override
  void update(double dt) {
    if(inputText.length>maxLength){
      inputText = inputText.substring(0,maxLength);
    }

    if(inputText.isEmpty){
      status = ProblemStatus.initial;
    }else if(inputText.isNotEmpty && !answer.contains(inputText)){
      status = ProblemStatus.solving;
    }else{
      status = ProblemStatus.success;
    }
    super.update(dt);
  }
}



