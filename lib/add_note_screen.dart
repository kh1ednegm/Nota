import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:nota/Model/node_model.dart';
import 'package:nota/Model/note_list_model.dart';
import 'package:provider/provider.dart';
import 'package:nota/exstenstions.dart';
class AddNote extends StatefulWidget {
   Note? _note;
   AddNote({Key? key,Note? note}) : super(key: key){
    _note = note!;
  }

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  late Color pickerColor;
  late Color currentColor;
  late DateTime time;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget._note);
    pickerColor = Colors.white;
    currentColor = widget._note?.color?.toColor()??Colors.white;
    time = DateTime.now();
    _titleController.text = widget._note?.title??'';
    _bodyController.text = widget._note?.body??'';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: currentColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded,color: Colors.black,size: 30,),
          onPressed: () {
            if( RegExp(r'^[\s]*[\s]*$').hasMatch(widget._note?.title??'') && RegExp(r'^[\s]*[\s]*$').hasMatch(widget._note?.body??'') && widget._note?.id != null) {
              print('Inside back to home to delete a note');
              Provider.of<Notes>(context,listen: false).deleteNote(widget._note!);
            }
            else{
              print('Idside back to home without deleting anything');
            }
            Navigator.of(context).pop();
          },
        ),
        actions: [
           TextButton(
             child: Text('Add',style: TextStyle(color: Colors.grey[800]),),
             onPressed: (){
               if( RegExp(r'^[\s]*[\s]*$').hasMatch(widget._note?.title??'') && RegExp(r'^[\s]*[\s]*$').hasMatch(widget._note?.body??'')) {
               }
               else{
                 widget._note!.date = time.toString();
                 widget._note!.color = currentColor.toString();
                 Provider.of<Notes>(context,listen: false).addNote(widget._note!);
               }
               Navigator.of(context).pop();
             },
           ),
          TextButton(
            child: Text('Save Editing',style: TextStyle(color: Colors.grey[800]),),
            onPressed: (){
              if(  RegExp(r'^[\s]*[\s]*$').hasMatch(widget._note?.title??'') && RegExp(r'^[\s]*[\s]*$').hasMatch(widget._note?.body??'') ) {
                Provider.of<Notes>(context,listen: false).deleteNote(widget._note!);
              }
              else{
                widget._note!.date = time.toString();
                widget._note!.color = currentColor.toString();
                Provider.of<Notes>(context,listen: false).editNote(widget._note!);
              }
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Delete',style: TextStyle(color: Colors.grey[800]),),
            onPressed: (){
                widget._note!.date = time.toString();
                widget._note!.color = currentColor.toString();
                Provider.of<Notes>(context,listen: false).deleteNote(widget._note!);
                Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
               TextField(
                decoration: InputDecoration(
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold
                  )
                ),
                 controller: _titleController,
                 onChanged: (value){
                    setState(() {
                      widget._note!.title = value;
                    });
                 },
              ),
               Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: 'Note',
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[500]
                      )
                  ),
                  maxLines: 30,
                  controller: _bodyController,
                  onChanged: (value){
                    setState(() {
                      widget._note!.body = value;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.color_lens_outlined,color: Colors.grey[800],size: 26,),
                    onPressed: (){
                        showDialog(
                        context: context,
                        builder: (context)=>AlertDialog(
                          content: ColorPicker(
                            pickerColor: pickerColor,
                            onColorChanged: (color){
                              setState(() => pickerColor = color);
                            },
                          ),
                          scrollable: true,
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: (){
                                setState(() => currentColor = pickerColor);
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        )
                        );
                        },
                  ),
                  Text(
                      DateFormat('yyyy/MMMM/dd   hh:mm a').format(time)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

