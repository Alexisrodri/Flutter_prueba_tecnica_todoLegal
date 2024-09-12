import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';
import '../screens.dart';

class SingDocumentScreen extends StatefulWidget {
  const SingDocumentScreen({super.key});

  @override
  State<SingDocumentScreen> createState() => _SingDocumentScreenState();
}

class _SingDocumentScreenState extends State<SingDocumentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppbar(context),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left_outlined),
                    iconSize: 30,
                    onPressed: () => context.pop(),
                  ),
                  const Text(
                    'Firmar Documentos',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: IgnorePointer(
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: const [
                    Tab(
                      child: Column(
                        children: [
                          Icon(Icons.document_scanner_outlined),
                          Text('Cargar documentos'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        children: [
                          Icon(Icons.people_alt_outlined),
                          Text('Indicar firmantes'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        children: [
                          Icon(Icons.bookmark_add_outlined),
                          Text('Personalizaciones'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        children: [
                          Icon(Icons.text_snippet_outlined),
                          Text('Resumen'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  LoadDocuments(tabController: _tabController),
                  BuildSignersTab(tabController: _tabController),
                  PersonalizationDocument(tabController: _tabController),
                  ResumeDocuments(tabController: _tabController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
