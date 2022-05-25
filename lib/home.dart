import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nota/Model/node_model.dart';
import 'package:nota/Model/note_list_model.dart';
import 'package:nota/add_note_screen.dart';
import 'package:nota/note_widget.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  late IconData icon;
  late bool isGrid;
  late int cellCount;
  Note note = Note(title: '',body: '',);
  @override
  void initState() {
    super.initState();
    icon = Icons.table_rows_outlined;
    isGrid = true;
    cellCount = 1;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded, color: Colors.blueGrey, size: 40),
        backgroundColor: Colors.grey[300],
        onPressed: () {

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNote(note: note,)));
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              sliver: SliverAppBar(
                floating: true,
                elevation: 0,
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                leading: Icon(
                  Icons.dehaze_outlined,
                  color: Colors.grey[600],
                ),
                title: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Search your notes',
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      icon,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {
                      setState(() {
                        if (isGrid) {
                          icon = Icons.grid_view;
                          cellCount = 2;
                        } else {
                          icon = Icons.table_rows_outlined;
                          cellCount = 1;
                        }
                        isGrid = !isGrid;
                      });
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://scontent.fcai20-5.fna.fbcdn.net/v/t39.30808-6/253054834_4281761328588169_6956235112307876625_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=174925&_nc_eui2=AeFES6fg-1YX0DDZG7jHA1JTNZzaaOW7ZRo1nNpo5btlGmdFxJ0ykcKKPMEyN7WjQ_SIsAz1f27v-1IJKiIeYOhg&_nc_ohc=84HVkgAmSKUAX83rytO&_nc_ht=scontent.fcai20-5.fna&oh=00_AT_qBm7Ef_gXa7LMsPHEtjttjYycFWlTd2N1N6P8N5Ceow&oe=626AC7E6'),
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: Consumer<Notes>(
                  builder: (context,notesModel,child){
                    if(notesModel.notes != null){
                      return StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        staggeredTileBuilder: (index) => StaggeredTile.fit(cellCount),
                        crossAxisCount: 2,
                        itemCount: notesModel.notes?.length,
                        itemBuilder: (context, index) => NoteWidget(
                            title: notesModel.notes?[index].title, body: notesModel.notes?[index].body,id: notesModel.notes?[index].id,
                            date: notesModel.notes?[index].date,color: notesModel.notes?[index].color),
                      );
                    }
                    else{
                      return const Center(
                        child: Text('Empty'),
                      );
                    }
                  },
                )),

            // SliverToBoxAdapter(
            //   child: Wrap(
            //     direction: Axis.horizontal,
            //     alignment: WrapAlignment.start,
            //
            //     children: List<NoteWidget>.generate(_notes.length, (index) => NoteWidget(title: _notes[index].title,body: _notes[index].body)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
