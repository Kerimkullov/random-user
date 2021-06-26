import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user/screens/user_bloc/user_bloc.dart';

class CustomError extends StatelessWidget {
  const CustomError({Key? key, this.message}) : super(key: key);
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Уппс, что пошло не так",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 16),
          Text(
            message!,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 16),
          Container(
            width: 100,
            child: ElevatedButton(
                child: Icon(Icons.replay_outlined),
                onPressed: () =>
                    BlocProvider.of<UserBloc>(context).add(GetUserEvent())),
          ),
        ],
      ),
    );
  }
}
