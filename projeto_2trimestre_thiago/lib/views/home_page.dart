import 'package:flutter/material.dart';
import 'package:projeto_2trimestre_thiago/dao/tarefaDao.dart';
import 'package:projeto_2trimestre_thiago/model/Tarefa.dart';
import 'package:projeto_2trimestre_thiago/views/add_tarefa.dart';
import 'package:projeto_2trimestre_thiago/views/tarefa_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tarefa> tarefas = [];

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  Future<void> carregarTarefas() async {
    final lista = await TarefaDao.instance.getTarefas();

    setState(() {
      tarefas = lista;
    });
  }

  String filtro = 'todas';
  List<Tarefa> get tarefasFiltradas {
    if (filtro == 'Pendentes') {
      return tarefas.where((tarefa) => !tarefa.concluida).toList();
    }

    if (filtro == 'Concluídas') {
      return tarefas.where((tarefa) => tarefa.concluida).toList();
    }

    return tarefas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Minhas Tarefas",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 1.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        filtro = 'Todas';
                      });
                    },
                    child: const Text("Todas"),
                  ),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        filtro = 'Pendentes';
                      });
                    },
                    child: const Text("Pendentes"),
                  ),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        filtro = 'Concluídas';
                      });
                    },
                    child: const Text("Concluídas"),
                  ),
                ],
              ),
            ),
          ),

          //item
          Expanded(
            child: ListView.builder(
              itemCount: tarefasFiltradas.length,

              itemBuilder: (context, index) {
                return TarefaItem(tarefa: tarefasFiltradas[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTarefa()),
          );

          carregarTarefas();
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}
