import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_echo/laravel_echo.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:socket_task/dio_helper.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  static TaskCubit get(context) => BlocProvider.of(context);

  bool getChatHistorySuccess = false;
  List<dynamic> chathistoryList = [];

  void getAllChatHistory({
    required String token,
    required String senderId,
  }) async {
    emit(GetChatHistoryLoading());
    await DioHelper.postData(
        url: "/Client/Conversation/show",
        token: token,
        data: {
          'sender_id': senderId,
          'user_type': '1',
          'conversation_id': '148'
        }).then((value) {
      chathistoryList = value.data['data']['items'].reversed.toList();
      getChatHistorySuccess = true;
      emit(GetChatHistorySuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetChatHistoryError(onError.toString()));
    });
  }

//   void getAllChatHistory({
//   required String token,
//   required String senderId,
// })async{
//     emit(GetChatHistoryLoading());
//     var headers = {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('https://38.105.232.194/aloha-api/api/Client/Conversation/show'));
//     request.fields.addAll({
//       'sender_id': senderId,
//       'user_type': '1',
//       'conversation_id': '148'
//     });
//     print("object1");
//     request.headers.addAll(headers);
//     print("object2");
//
//     http.StreamedResponse response = await request.send();
//     print("object3");
//
//     final responsing = await http.Response.fromStream(response);
//     final data = jsonDecode(responsing.body);
//     print("object4");
//
//     if (response.statusCode == 200) {
//       print("object5");
//
//       chathistoryList=await data['data']['items'].reversed.toList();
//       getChatHistorySuccess=true;
//       emit(GetChatHistorySuccess());
//     }
//     else {
//       print("object6");
//
//       print(data['message']);
//       emit(GetChatHistoryError());
//
//     }
//   }

  Future<void> sendMsg({
    required String token,
    required String senderId,
    required String msg,
  }) async {
    emit(SendMessageLoading());
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://38.105.232.194/aloha-api/api/Client/Conversation/SendMessage'));
    request.fields.addAll({
      'conversation_id': '148',
      'sender_type': '1',
      'sender_id': senderId,
      'message_type': '1',
      'message': msg
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final responsing = await http.Response.fromStream(response);
    final data = jsonDecode(responsing.body);

    if (response.statusCode == 200) {
      emit(SendMessageSuccess());
    } else {
      print("${data['message']}");
      emit(SendMessageError());
    }
  }

  /// Socket Instance
  ///
  ///
  final io.Socket socket =
      io.io('http://38.105.232.194:6001', <String, dynamic>{
    'transports': ['websocket'],
    'forceNew': true
  });

  void socketOfChat() async {
    emit(ConnectSocketLoading());
    print('waiting Connection');
    socket.connect();
    socket.onConnect((data) {
      print('connected successfully $data');
    });
    socket.onDisconnect((_) => print('channel disconnected'));
    socket.onConnectError((error) => print("the error : $error"));
    socket.onError((error) => emit(ConnectSocketError(error.toString())));

    // socket.on('Conversation.148', (data) => print("data : $data"));

    /// Create echo instance
    Echo echo = Echo(
      broadcaster: EchoBroadcasterType.SocketIO,
      client: socket,
    );
    echo.connect();

    /// Accessing socket instance
    echo.connector.socket.on(
      'connect',
      (data) => print('Laravel connected Success'),
    );
    echo.connector.socket.on('disconnect', (data) => print('Laravel disconnected'));
    echo.connector.socket.on(
      'error',
      (data) => print('error is : $data'),
    );
    emit(ConnectSocketSuccess());
// Listening presence channel
// Needs auth. See details how to authorize channel below in guides
//   echo.join('Conversation.148')
//       .here((users) {
//     print(users);
//   }).joining((user) {
//     print(user);
//   }).leaving((user) {
//     print(user);
//   }).listen('.NewMessage', (e) {
//     print(e);
//   });
    /// Listening to channel
    echo.channel('Conversation.148').listen('.NewMessage', (data) {
      print('New user Msg : $data');

      chathistoryList.add(data);
      emit(SocketListenNewMsg());
    });

    echo.connector.socket.on(
      'error',
      (data) => print('error is : $data'),
    );
  }
}
