part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class GetChatHistoryLoading extends TaskState {}
class GetChatHistorySuccess extends TaskState {}
class GetChatHistoryError extends TaskState {
  final String msg;

  GetChatHistoryError(this.msg);
}

class SendMessageLoading extends TaskState {}
class SendMessageSuccess extends TaskState {}
class SendMessageError extends TaskState {}

class ConnectSocketLoading extends TaskState {}
class ConnectSocketSuccess extends TaskState {}
class ConnectSocketError extends TaskState {
  final String error ;

  ConnectSocketError(this.error);
}
class SocketListenNewMsg extends TaskState {}

