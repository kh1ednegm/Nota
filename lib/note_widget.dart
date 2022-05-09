import 'package:flutter/material.dart';
import 'package:nota/add_note_screen.dart';
import 'package:nota/exstenstions.dart';
import 'Model/node_model.dart';

class NoteWidget extends StatelessWidget {
  final String? title,body,color,date;
  final int? id;
  const NoteWidget({Key? key,this.title,this.body, this.color, this.date,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: (){
         Navigator.of(context).push(MaterialPageRoute(
           builder: (context)=>AddNote(note: Note(title:title,body: body, color: color,date: date,id: id),)
         ));
       },
      child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(8),
          //clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            color: color?.toColor()??Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(title??'',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(body??'',
                //softWrap: true,
                maxLines: 13,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey[800]
                ),
              )
            ],
          )
      ),
    );
  }
}
