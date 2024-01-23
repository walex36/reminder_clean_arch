import 'package:flutter/material.dart';

class DialogCategoryWidget extends StatefulWidget {
  final Color color;
  const DialogCategoryWidget({Key? key, required this.color}) : super(key: key);

  @override
  State<DialogCategoryWidget> createState() => _DialogCategoryWidgetState();
}

class _DialogCategoryWidgetState extends State<DialogCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Categorias',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            SizedBox(height: 20),
            Wrap(
              children: [
                _buildItens(title: 'Trabalho', isSelected: true),
                _buildItens(title: 'Pessoal'),
                _buildItens(title: 'Estudos'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItens({required String title, bool isSelected = false}) {
    return Card(
      color: isSelected ? widget.color : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,
            style: TextStyle(fontWeight: isSelected ? FontWeight.w600 : null)),
      ),
    );
  }
}
