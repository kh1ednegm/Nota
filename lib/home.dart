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
  // Container _note= Container(
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.circular(15),
  //   ),
  //   child: Column(
  //     children: [
  //       Text('News reporter',
  //         style: TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.black,
  //         ),
  //       ),
  //       Text('- I have here <Name> one of iti students \n- Hi, <Name> how are you? \n- Now let me ask you about ur first day at iti tell me how was it? \n- I\'d like to know your opinion on technical courses : Are they good enough for what the market needs? \n- ok what about the instructors ? \n- Tell me about the English course \n- thanks <Name> for your time \n- Now i back for you, Younis and Ahmed',
  //           style: TextStyle(
  //             color: Colors.black
  //           ),
  //       )
  //     ],
  //   )
  // );


  /*
   = [
    Note(
        title: 'News reporter',
        body: '''- I have here <Name> one of iti students
   - Hi, <Name> how are you?
   - Now let me ask you about ur first day at iti tell me how was it?
   - I'd like to know your opinion on technical courses : Are they good enough for what the market needs?
   - ok what about the instructors ?
   - Tell me about the English course
   - thanks <Name> for your time
   - Now i back for you, Younis and Ahmed'''),
    Note(title: 'Password', body: '''M!n@2021

Kalashmawy
4071@iti'''),
    Note(title: '', body: '''Static link vs dynamic link
Return 0;
Flowchart in programming
Task 1
Reverse an integer
Is Prime?
Prime numbers before a number

Print an array
Sum of array
Max in array
Min in array

Print a matrix with gotoxy

average of each column


1-

New
Display
Exit
          With up and down and home and end
          And display new selected when he press enter           or esc

2-

 Extended key or normal key and display the ASCII code

3 -
Get 2 string variable s from user and concatenate them in a single string variable(full name)

4
Array of string variables and print them  heighlighted with numbers

5-
Get a string and display its length

'''),
    Note(title: 'Lab 10'),
    Note(title: 'OOP Lab3', body: '''1- Implement the queue data structure
   enqueue and dequeue
2- copy constructor for stack
3- Rectangle class
4- Circle class (radius '''),
    Note(
        title: 'Market collocations',
        body:
            '''Market share represents the percentage of total sales which a company has in a specific industry or market. And that takes us to our next term Market leader. It is a company which has the largest market share. Often, the market leader is the company which took first steps in that market. And that takes us to our next term which is Market challenger. And Market challenger is just below the market leader and its aim is to expand its market share and become the Market leader. Next term is market segment and market segment is a group of customers who share similar characteristics and that helps companies to target different categories of customers. last term is Market research which is an organized effort to collect information about target market and customers.'''),
    Note(
        title: 'Product collocations',
        body:
            '''As i read from internet, A product life cycle is the whole time a product can exist at market from its lunch until it's pushed out of the market. Product lunch is the first phase, it's the process of introducing a new product for customers.
And to increase products awareness. Endorsement is a form of advertising that uses famous personalities. For example, Cristiano Ronaldo with clear men collection. product placement is another form of advertising in which a product is featured in a production that targets a large audience such as movies. For example, Audi placed its cars in marvel movies. A product range is a group of products that have similar characteristics in function and price.''')
  ];
    */
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