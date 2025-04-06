import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/cubits/mainPage_cubit.dart';
import 'package:to_do/model/todo_model.dart';
import 'package:to_do/ui/registerPage.dart';
import 'package:to_do/ui/upgradePage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<Mainpage> {
  TextEditingController c1 = TextEditingController();
  var isResearching = false;
  @override
  void initState() {
    context.read<MainPageCubit>().getToDoList();
    super.initState();
  }

  @override
  void dispose() {
    c1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) {
                    return RegisterPage();
                  },
                ),
              )
              .then((value) {
                context.read<MainPageCubit>().getToDoList();
              });
        },
      ),
      appBar: AppBar(
        title: Text('Anasayfa'),
        actions: [
          isResearching
              ? Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: TextField(
                      onChanged: (value) {
                   
                          context.read<MainPageCubit>().filter(value);
                   
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isResearching = !isResearching;
                      });
                    },
                    icon: Icon(Icons.exit_to_app),
                  ),
                ],
              )
              : IconButton(
                onPressed: () {
                  setState(() {
                    isResearching = !isResearching;
                  });
                },
                icon: Icon(Icons.find_in_page),
              ),
        ],
      ),
      body: BlocBuilder<MainPageCubit, List<TodoModel>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 100,
                  width: 100,
                  child: Card(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${state[index].id.toString()}-',
                              style: TextStyle(fontSize: 23),
                            ),
                            Text(
                              state[index].title.toString(),
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              state[index].text.toString(),
                              style: TextStyle(fontSize: 23),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<MainPageCubit>().delete(
                                  state[index].id,
                                );
                              },
                              icon: Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Upgradepage(
                                            id: state[index].id,
                                            text: state[index].text,
                                            title: state[index].title,
                                          );
                                        },
                                      ),
                                    )
                                    .then((value) {
                                      context
                                          .read<MainPageCubit>()
                                          .getToDoList();
                                    });
                              },
                              icon: Icon(Icons.upgrade),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
