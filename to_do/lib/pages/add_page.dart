import 'package:flutter/material.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/widgets/custom_tex_field.dart';
import 'package:shimmer/shimmer.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController subTitleController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xfff8f8f6),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/circ.png'), fit: BoxFit.cover),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 209),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 551,
                  decoration: BoxDecoration(
                    color: Color(0xff30384c),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Add a new list',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Custom_text_field(hint: 'Add Title'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Custom_text_field(hint: 'Add SubTitle'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Shimmer.fromColors(
                              highlightColor: Colors.transparent,
                              baseColor: Colors.white,
                              child: Text('Add')))
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
