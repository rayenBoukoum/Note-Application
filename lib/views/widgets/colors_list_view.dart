import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive 
    ?  CircleAvatar(
      backgroundColor: Colors.white,
      radius: 35,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 32,
      ),
    )
    :  CircleAvatar(
      backgroundColor: color,
      radius: 35,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int currentIndex = 0;
  List<Color> colors = [
    Color(0xffac3931),
    Color(0xffe5d352),
    Color(0xff537d8d),
    Color(0xff482c3d),
    Color(0xffd9e76c)
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35*2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6,),
            child:  GestureDetector(
              onTap: (){
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isActive :currentIndex == index
                ),
              ),
          );
        }
        
      ),
    );
  }
}