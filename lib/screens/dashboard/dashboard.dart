import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10, left: 10),
            child: const Labels(
              text: 'Dashboard',
              secondText: 'Bienvenido Paul',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            '¿Qué Quieres Hacer?',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomListTile(
            title: 'Firmar Documentos',
            subtitle:
                'Firma documentos electrónicos y solicita la firma de terceros.',
            icon: Icons.document_scanner_outlined,
            secondIcon: Icons.chevron_right_rounded,
            onPress: () => context.push('/sign-documents'),
          ),
          const CustomListTile(
            title: 'Solicitudes de Acceso a Información',
            subtitle:
                'Tienes 4 solicitudes de acceso a tu información personal.',
            icon: Icons.pending_actions_rounded,
            secondIcon: Icons.chevron_right_rounded,
          ),
          const CustomListTile(
            title: 'Gestionar mi información personal',
            subtitle:
                'Actualiza tu información, solicita acceso,rectificación, eliminación.',
            icon: Icons.lock_person_outlined,
            secondIcon: Icons.chevron_right_rounded,
          ),
        ],
      ),
    );
  }
}
