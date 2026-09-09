import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfWorksheetService {
  static Future<void> generateAndPrintWorksheet({
    required String hindiPrompt,
    required String santhaliOlChiki,
    required String santhaliPhonetic,
    required String flnTag,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (pw.Context context) {
          return pw.Column(
            cross: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.all(12),
                decoration: pw.BoxDecoration(
                  color: PdfColors.teal700,
                  borderRadius: pw.BorderRadius.circular(6),
                ),
                child: pw.Column(
                  cross: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'PALASH MTB-MLE PROGRAMME | JHARKHAND',
                      style: pw.TextStyle(
                        color: PdfColors.white,
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'NIPUN Bharat FLN Worksheet',
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 18,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Container(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: pw.BoxDecoration(
                            color: PdfColors.orange800,
                            borderRadius: pw.BorderRadius.circular(4),
                          ),
                          child: pw.Text(
                            'TAG: $flnTag',
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 10,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Student Name: _______________________',
                      style: const pw.TextStyle(fontSize: 12)),
                  pw.Text('Date: ____________',
                      style: const pw.TextStyle(fontSize: 12)),
                  pw.Text('Class: Primary 1-3',
                      style: const pw.TextStyle(fontSize: 12)),
                ],
              ),
              pw.SizedBox(height: 16),
              pw.Divider(thickness: 1, color: PdfColors.grey400),
              pw.SizedBox(height: 10),
              pw.Text(
                'Classroom Task & Language Bridge',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.teal900,
                ),
              ),
              pw.SizedBox(height: 8),
              pw.Table(
                border: pw.TableBorder.all(color: PdfColors.teal800, width: 1),
                children: [
                  pw.TableRow(
                    decoration:
                        const pw.BoxDecoration(color: PdfColors.teal50),
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Hindi Prompt (Teacher)',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text('Santhali Equivalent (Student)',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(12),
                        child: pw.Column(
                          cross: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(hindiPrompt,
                                style: pw.TextStyle(
                                    fontSize: 16,
                                    fontWeight: pw.FontWeight.bold)),
                          ],
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(12),
                        child: pw.Column(
                          cross: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(santhaliOlChiki,
                                style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.teal800)),
                            pw.SizedBox(height: 4),
                            pw.Text('Phonetic: $santhaliPhonetic',
                                style: const pw.TextStyle(
                                    fontSize: 11,
                                    color: PdfColors.grey700)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 24),
              pw.Text(
                'Student Writing & Counting Practice Area',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.teal900,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.GridView(
                crossAxisCount: 4,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(
                  8,
                  (index) => pw.Container(
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.grey500,
                        style: pw.BorderStyle.dashed,
                      ),
                      borderRadius: pw.BorderRadius.circular(4),
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        '${index + 1}',
                        style: const pw.TextStyle(
                            color: PdfColors.grey400, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ),
              pw.Spacer(),
              pw.Divider(thickness: 1, color: PdfColors.grey300),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Generated via PALASH Offline Software Suite',
                      style: const pw.TextStyle(
                          fontSize: 9, color: PdfColors.grey600)),
                  pw.Text('Teacher Signature: ______________',
                      style: const pw.TextStyle(
                          fontSize: 9, color: PdfColors.grey600)),
                ],
              )
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
