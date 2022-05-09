

import '../data/local/db/constants.dart';

class Note {
  String? title,body,color,date;
  int? id;


  Note({String? title,String? body,String? color,String? date,int? id}){
    this.title = title;
    this.body = body;
    this.id = id;
    this.color = color;
    this.date = date;
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = {
      NOTE_ID:id,
      NOTE_TITLE: title,
      NOTE_BODY : body,
      NOTE_BACKGROUND_COLOR : color,
      NOTE_DATE : date
    };
    return map;
  }

  Note.fromMap(Map<String,dynamic> map){
    title = map[NOTE_TITLE];
    body = map[NOTE_BODY];
    id = map[NOTE_ID];
    color = map[NOTE_BACKGROUND_COLOR];
    date = map[NOTE_DATE];
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Title: ${title??''} Body: ${body??''} Date: ${date??''} color: ${color??''}';
  }

}