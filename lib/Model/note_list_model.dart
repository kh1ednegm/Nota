
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nota/Model/node_model.dart';
import 'package:nota/data/local/db/db_helper.dart';

class Notes extends ChangeNotifier{
  List<Note>? notes;
  Notes(){
    fetchData();
  }


  Future<void> fetchData()async{
    notes = await DbHelper.helper.getAll();
    notifyListeners();
  }

   Future<void> addNote(Note note)async{
      await DbHelper.helper.insert(note);
      notes?.insert(0, note);
      notifyListeners();
   }

   Future<void> editNote(Note note)async{
    await DbHelper.helper.update(note);
    notes?[notes!.indexWhere((element) => element.id == note.id)] = note;
    notifyListeners();
   }

   Future<void> deleteNote(Note note)async{
    var index = notes!.indexWhere((element) => element.id == note.id);
    await DbHelper.helper.delete(note);
    notes?.removeAt(index);
    notifyListeners();
   }



}