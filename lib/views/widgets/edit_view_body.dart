import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/views/widgets/colors_list_view.dart';
import 'package:noteapp/views/widgets/custom_app_bar.dart';
import 'package:noteapp/views/widgets/custom_text_field.dart';

import '../../models/note_model.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

  String? title,content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children:  [
          const SizedBox(height: 50,),
          CustomAppBar(
            onPressed: (){
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: "Edit Notes",
            icon: Icons.check,
          ),
          const SizedBox(height: 50,),
          CustomTextField(
            onChanged: (value){
              title = value;
            },
            hint: widget.note.title,
          ),
          const SizedBox(height: 16,),
          CustomTextField(
            onChanged: (value){
              content = value;
            },
            hint: widget.note.subTitle,
            maxLines: 5
          ),
          const ColorsListView(),
        ],
      ),
    );
  }
}