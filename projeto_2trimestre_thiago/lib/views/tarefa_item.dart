import 'package:flutter/material.dart';
import 'package:projeto_2trimestre_thiago/dao/tarefaDao.dart';
import 'package:projeto_2trimestre_thiago/model/Tarefa.dart';

class TarefaItem extends StatefulWidget {
  final Tarefa tarefa;
  const TarefaItem({super.key, required this.tarefa});

  @override
  State<TarefaItem> createState() => _TarefaItemState();
}

class _TarefaItemState extends State<TarefaItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Checkbox(
          value: widget.tarefa.concluida,

          onChanged: (value) async {
            setState(() {
              widget.tarefa.concluir();
            });

            await TarefaDao.instance.update(widget.tarefa);
          },
        ),

        title: Text(
          widget.tarefa.titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.tarefa.descricao),

              const SizedBox(height: 8),

              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 6, // Espaçamento padrão entre ícone e texto
                children: [
                  const Icon(Icons.flag, size: 16, color: Colors.red),
                  Text(widget.tarefa.prioridade),

                  const SizedBox(
                    width: 10,
                  ), // Espaço extra apenas entre os blocos de informação

                  const Icon(Icons.calendar_today, size: 14),
                  Text(
                    '${widget.tarefa.prazo.day}/'
                    '${widget.tarefa.prazo.month}',
                  ),

                  const SizedBox(width: 10),

                  Text(widget.tarefa.categoria),
                ],
              ),
            ],
          ),
        ),

        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
