import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_task/task_cubit.dart';

import 'AllChats.dart';

class ChatHistory extends StatelessWidget {
  String token, senderId, title;

  ChatHistory(
      {super.key,
      required this.token,
      required this.senderId,
      required this.title});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskCubit()..getAllChatHistory(token: token, senderId: senderId)..socketOfChat(),
      child: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = TaskCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllChats()));
                    cubit.socket.disconnect();
                    cubit.socket.dispose();
                    cubit.socket.destroy();
                  },
                  icon: Icon(Icons.keyboard_backspace_sharp)),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    cubit.getChatHistorySuccess==false
                        ? const Expanded(
                            child: Center(child: CircularProgressIndicator()))
                        : Expanded(
                            child: ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                if (cubit.chathistoryList[index]['receiverId']
                                    .toString() ==senderId) {
                                  return Row(
                                    children: [
                                      CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.grey,
                                          child:Image(image: NetworkImage("${(cubit.chathistoryList[index]['SenderPhoto'])}"),)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.grey),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              cubit.chathistoryList[index]
                                              ['message'].toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                } else {
                                  //isme==false;
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.blue),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              cubit.chathistoryList[index]
                                              ['message'].toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CircleAvatar(
                                          radius: 15,
                                          child: Image(image: NetworkImage("${(cubit.chathistoryList[index]['SenderPhoto'])}"),)),
                                    ],
                                  );

                                }
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 5,
                                );
                              },
                              itemCount: cubit.chathistoryList.length,
                            ),
                          ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: MediaQuery.of(context).size.width * 0.62,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                onTap: () {
                                  // setState(() {
                                  //   showAttachmentContaner = false;
                                  //   emojiShowing = false;
                                  //   keyboardOpen = true;
                                  //   hightlistview = 0.4;
                                  // });
                                  // jumpDown();
                                },
                                cursorColor: Colors.black,
                                controller: controller,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade200,
                                  border: InputBorder.none,
                                  hintText: "Type something",
                                ),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                            radius: 30,
                            child: IconButton(
                              onPressed: () async{
                                await cubit.sendMsg(
                                    token: token,
                                    senderId: senderId,
                                    msg: controller.text);
                                controller.clear();
                                print("my Id is $senderId");
                              },
                              icon: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
