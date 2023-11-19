import 'package:flutter/material.dart';
import 'package:to_do/models/list_model.dart';
import 'package:to_do/pages/add_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do/services/get_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff8f8f6),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/circ.png'), fit: BoxFit.cover),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 209),
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
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Color(0xffffffff),
                            hintText: 'Search',
                            filled: true,
                            suffixIcon: Icon(Icons.search),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 425, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddPage()));
                              },
                              child: Shimmer.fromColors(
                                highlightColor: Colors.transparent,
                                baseColor: Colors.white,
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder<List<ListModel>>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, i) {
                            return Card(
                              child: CheckboxListTile(
                                title: Text(snapshot.data![i].title.toString()),
                                subtitle:
                                    Text(snapshot.data![i].subtitle.toString()),
                                value: false,
                                onChanged: (value) async {},
                              ),
                            );
                          });
                    }
                  }),
            ],
          ),
        ),
      ]),
    );
  }
}
