import 'package:flutter/material.dart';

class DismissibleWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const DismissibleWidget({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(UniqueKey().toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.0),
        color: Theme.of(context).colorScheme.error,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: child,
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(
                    'Deseja realmente apagar o desconto?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(
                        'Deletar',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      onPressed: onPressed,
                    ),
                  ],
                );
              });
        } else {
          return false;
        }
      },
    );
  }
}
