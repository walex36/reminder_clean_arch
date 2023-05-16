import 'package:flutter/material.dart';

class ListColorsReminders extends StatefulWidget {
  final Color? colorSelect;
  final Function colorOnTap;
  const ListColorsReminders(
      {Key? key, required this.colorSelect, required this.colorOnTap})
      : super(key: key);

  @override
  State<ListColorsReminders> createState() => _ListColorsRemindersState();
}

class _ListColorsRemindersState extends State<ListColorsReminders> {
  late Color colorSelect;

  List<Color> colors = [];

  @override
  void initState() {
    super.initState();
    colors.add(Colors.grey.shade300);
    colors.addAll(Colors.accents.map((e) => e).toList());
  }

  @override
  Widget build(BuildContext context) {
    colorSelect = widget.colorSelect ?? colors.first;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            setState(() {
              colorSelect = colors[index];
            });
            widget.colorOnTap(colors[index]);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: colors[index].value == colorSelect.value
                ? const Icon(
                    Icons.check,
                    size: 28,
                  )
                : null,
            decoration: BoxDecoration(
                color: colors[index],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)),
            width: 55,
          ),
        );
      },
    );
  }
}
