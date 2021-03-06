import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_block_2/blocs/update_page_cubit.dart';
import 'package:patterns_block_2/model/contact_model.dart';

Widget viewOfUpdate(BuildContext context, TextEditingController titleController, TextEditingController bodyController, String id, bool isLoading) {
  return Container(
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Contact contact = Contact(username: titleController.text.toString(), phoneNumber: bodyController.text.toString(), id: id);
                BlocProvider.of<UpdatePageCubit>(context).apiContactUpdate(contact);
              },
              color: Colors.blue,
              child: Text(
                "Update a contact",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        isLoading ? Center(
          child: CircularProgressIndicator(),
        ): SizedBox.shrink(),
      ],
    ),
  );
}