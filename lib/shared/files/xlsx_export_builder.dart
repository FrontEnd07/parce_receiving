import 'dart:convert';

import 'package:archive/archive.dart';

class XlsxRow {
  const XlsxRow({
    required this.trackingCode,
    required this.weightGrams,
    required this.scannedAt,
  });
  final String trackingCode;
  final int? weightGrams;
  final DateTime scannedAt;
}

class XlsxExportBuilder {
  List<int> build(List<XlsxRow> rows) {
    final archive = Archive();
    _add(archive, '[Content_Types].xml', _contentTypes);
    _add(archive, '_rels/.rels', _rootRelationships);
    _add(archive, 'xl/workbook.xml', _workbook);
    _add(archive, 'xl/_rels/workbook.xml.rels', _workbookRelationships);
    _add(archive, 'xl/styles.xml', _styles);
    _add(archive, 'xl/worksheets/sheet1.xml', _sheet(rows));
    return ZipEncoder().encode(archive);
  }

  void _add(Archive archive, String name, String content) {
    final bytes = utf8.encode(content);
    archive.addFile(ArchiveFile(name, bytes.length, bytes));
  }

  String _sheet(List<XlsxRow> rows) {
    final cells = <String>[
      '<row r="1"><c r="A1" t="inlineStr"><is><t>Трек-код</t></is></c><c r="B1" t="inlineStr"><is><t>Вес (кг)</t></is></c><c r="C1" t="inlineStr"><is><t>Дата сканирования</t></is></c></row>',
    ];
    for (var index = 0; index < rows.length; index++) {
      final row = rows[index];
      final number = index + 2;
      final weight = row.weightGrams == null
          ? ''
          : '<c r="B$number"><v>${row.weightGrams! / 1000}</v></c>';
      final date =
          row.scannedAt
              .toUtc()
              .difference(DateTime.utc(1899, 12, 30))
              .inMilliseconds /
          Duration.millisecondsPerDay;
      cells.add(
        '<row r="$number"><c r="A$number" t="inlineStr"><is><t>${_escape(row.trackingCode)}</t></is></c>$weight<c r="C$number" s="1"><v>$date</v></c></row>',
      );
    }
    return '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><sheetData>${cells.join()}</sheetData></worksheet>';
  }

  String _escape(String value) => value
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;');
}

const _contentTypes =
    '<?xml version="1.0" encoding="UTF-8"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/><Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/><Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/></Types>';
const _rootRelationships =
    '<?xml version="1.0" encoding="UTF-8"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/></Relationships>';
const _workbook =
    '<?xml version="1.0" encoding="UTF-8"?><workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"><sheets><sheet name="Посылки" sheetId="1" r:id="rId1"/></sheets></workbook>';
const _workbookRelationships =
    '<?xml version="1.0" encoding="UTF-8"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/></Relationships>';
const _styles =
    '<?xml version="1.0" encoding="UTF-8"?><styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><numFmts count="1"><numFmt numFmtId="164" formatCode="yyyy-mm-dd hh:mm"/></numFmts><fonts count="1"><font><sz val="11"/><name val="Calibri"/></font></fonts><fills count="1"><fill><patternFill patternType="none"/></fill></fills><borders count="1"><border/></borders><cellStyleXfs count="1"><xf/></cellStyleXfs><cellXfs count="2"><xf xfId="0"/><xf numFmtId="164" applyNumberFormat="1"/></cellXfs></styleSheet>';
