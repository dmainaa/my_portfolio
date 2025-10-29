import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:portfolio_components/portfolio_components.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PFResumeGenerator {
  static Future<pw.Document> generateResumePDF(PFResume resume) async {
    final pdf = pw.Document();

    // Define colors
    final primaryColor = PdfColor.fromHex('#483AA0');
    final accentColor = PdfColor.fromHex('#E3D095');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (context) => [
          // Header with gradient-like effect
          pw.Container(
            padding: const pw.EdgeInsets.all(20),
            decoration: pw.BoxDecoration(
              color: primaryColor.shade(0.7),
              borderRadius: pw.BorderRadius.circular(10),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  resume.name,
                  style: pw.TextStyle(
                    fontSize: 32,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.white,
                  ),
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  resume.title,
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                    color: accentColor,
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 20),

          // Contact Information
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              _buildContactItem('Email', resume.email),
              _buildContactItem('Phone', resume.phone),
            ],
          ),
          pw.SizedBox(height: 8),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              _buildContactItem('Location', resume.location),
              _buildContactItem('Website', resume.website),
            ],
          ),
          pw.SizedBox(height: 30),

          // Professional Summary
          _buildSectionTitle('Professional Summary', primaryColor),
          pw.SizedBox(height: 10),
          pw.Container(
            padding: const pw.EdgeInsets.all(15),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: primaryColor.shade(0.3)),
              borderRadius: pw.BorderRadius.circular(8),
            ),
            child: pw.Text(
              resume.summary,
              style: const pw.TextStyle(
                fontSize: 11,
                lineSpacing: 1.5,
              ),
              textAlign: pw.TextAlign.justify,
            ),
          ),
          pw.SizedBox(height: 30),

          // Work Experience
          _buildSectionTitle('Work Experience', primaryColor),
          pw.SizedBox(height: 10),
          ...resume.workExperience.map((exp) => pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                    padding: const pw.EdgeInsets.all(15),
                    margin: const pw.EdgeInsets.only(bottom: 15),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: primaryColor.shade(0.3)),
                      borderRadius: pw.BorderRadius.circular(8),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    exp.position,
                                    style: pw.TextStyle(
                                      fontSize: 14,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                  pw.SizedBox(height: 4),
                                  pw.Text(
                                    exp.company,
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      color: accentColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Text(
                              exp.period,
                              style: pw.TextStyle(
                                fontSize: 10,
                                fontWeight: pw.FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          exp.description,
                          style: const pw.TextStyle(
                            fontSize: 10,
                            lineSpacing: 1.4,
                          ),
                        ),
                        if (exp.achievements.isNotEmpty) ...[
                          pw.SizedBox(height: 10),
                          ...exp.achievements.map(
                            (achievement) => pw.Padding(
                              padding: const pw.EdgeInsets.only(bottom: 5),
                              child: pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Container(
                                    margin: const pw.EdgeInsets.only(
                                      top: 4,
                                      right: 8,
                                    ),
                                    width: 4,
                                    height: 4,
                                    decoration: pw.BoxDecoration(
                                      color: primaryColor,
                                      shape: pw.BoxShape.circle,
                                    ),
                                  ),
                                  pw.Expanded(
                                    child: pw.Text(
                                      achievement,
                                      style: const pw.TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              )),

          // Education
          _buildSectionTitle('Education', primaryColor),
          pw.SizedBox(height: 10),
          ...resume.education.map((edu) => pw.Container(
                padding: const pw.EdgeInsets.all(15),
                margin: const pw.EdgeInsets.only(bottom: 10),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: primaryColor.shade(0.3)),
                  borderRadius: pw.BorderRadius.circular(8),
                ),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            edu.degree,
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(height: 4),
                          pw.Text(
                            edu.institution,
                            style: pw.TextStyle(
                              fontSize: 10,
                              color: accentColor,
                            ),
                          ),
                          if (edu.description != null) ...[
                            pw.SizedBox(height: 6),
                            pw.Text(
                              edu.description!,
                              style: const pw.TextStyle(fontSize: 10),
                            ),
                          ],
                        ],
                      ),
                    ),
                    pw.Text(
                      edu.period,
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              )),
          pw.SizedBox(height: 20),

          // Skills
          _buildSectionTitle('Skills', primaryColor),
          pw.SizedBox(height: 10),
          pw.Wrap(
            spacing: 8,
            runSpacing: 8,
            children: resume.skills
                .map(
                  (skill) => pw.Container(
                    padding: const pw.EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: pw.BoxDecoration(
                      color: primaryColor.shade(0.8),
                      borderRadius: pw.BorderRadius.circular(15),
                      border: pw.Border.all(color: primaryColor.shade(0.3)),
                    ),
                    child: pw.Text(
                      skill,
                      style: pw.TextStyle(
                        fontSize: 9,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.white,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );

    return pdf;
  }

  static pw.Widget _buildSectionTitle(String title, PdfColor color) {
    return pw.Container(
      padding: const pw.EdgeInsets.only(bottom: 8),
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: color, width: 2),
        ),
      ),
      child: pw.Text(
        title,
        style: pw.TextStyle(
          fontSize: 16,
          fontWeight: pw.FontWeight.bold,
          color: PdfColor.fromHex('#E3D095'),
        ),
      ),
    );
  }

  static pw.Widget _buildContactItem(String label, String value) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            fontSize: 9,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.grey600,
          ),
        ),
        pw.SizedBox(height: 2),
        pw.Text(
          value,
          style: const pw.TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  /// Download PDF - optimized for web
  static Future<void> downloadPDF(pw.Document pdf, String filename) async {
    final bytes = await pdf.save();

    if (kIsWeb) {
      // For web, use layoutPdf which opens print dialog with save option
      await Printing.layoutPdf(
        onLayout: (format) async => bytes,
        name: filename,
      );
    } else {
      // For mobile/desktop, try to share or save
      try {
        await Printing.sharePdf(
          bytes: bytes,
          filename: filename,
        );
      } catch (e) {
        // Fallback: save to app directory
        final output = await getApplicationDocumentsDirectory();
        final file = File('${output.path}/$filename');
        await file.writeAsBytes(bytes);
      }
    }
  }
}
