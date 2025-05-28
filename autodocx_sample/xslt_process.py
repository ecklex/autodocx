import os
from lxml import etree
import re

# Ordnernamen definieren
input_folder = "Input"
xml_folder = "XML"
xslfo_folder = "XSL-FO"
xslt_folder = "XSLT"

# XSLT-Dateien
word_to_xml_xslt = os.path.join(xslt_folder, "Word-to-XML.xslt")
xml_to_xslfo_xslt = os.path.join(xslt_folder, "XML-to-XSLFO.xslt")

def transform_xml(input_xml, xslt_path, output_xml):
    # Transformiert eine XML-Datei mit einer XSLT-Datei.
    xslt_tree = etree.parse(xslt_path)
    transform = etree.XSLT(xslt_tree)

    input_tree = etree.parse(input_xml)
    result_tree = transform(input_tree)

    result_tree.write(output_xml, pretty_print=True, encoding="utf-8")
    
def add_chapter_tags(xml_path):
    # Fügt <chapter>-Tags vor jedem <h1> oder <h1_num> in der XML-Datei hinzu
    with open(xml_path, "r", encoding="utf-8") as file:
        xml_content = file.read()
        
    # Schritt 1: <chapter> öffnen vor jedem <h1> oder <h1_num>
    pattern_open = r"(<h1[^>]*>|<h1_num[^>]*>)"
    replacement_open = r"<chapter>\1"
    xml_content = re.sub(pattern_open, replacement_open, xml_content)
    
    # Schritt 2: </chapter> schließen vor jedem <chapter><h1> oder <chapter><h1_num>
    pattern_close = r"(<chapter><h1[^>]*>|<h1_num[^>]*>)"
    replacement_close = r"</chapter>\1"
    xml_content = re.sub(pattern_close, replacement_close, xml_content)
    
    # Schritt 3: </chapter> vor <document>-element einfügen
    xml_content = xml_content.replace("</document>", "</chapter></document>")
    
    # Schritt 4: das allererste </chapter> entfernen
    xml_content = xml_content.replace("</chapter>", "", 1)
    

    with open(xml_path, "w", encoding="utf-8") as file:
        file.write(xml_content)


def main():
    processed_files = 0  # Zähler für erfolgreich verarbeitete Dateien

    for file_name in os.listdir(input_folder):
        # Überspringe temporäre Dateien oder Dateien, die nicht mit .xml enden
        if file_name.startswith("~$") or not file_name.endswith(".xml"):
            continue

        input_xml_path = os.path.join(input_folder, file_name)

        # Schritt 1: XML aus Input-Ordner in XML-Ordner kopieren und transformieren
        base_name = os.path.splitext(file_name)[0]
        xml_output = os.path.join(xml_folder, f"{base_name}.xml")
        transform_xml(input_xml_path, word_to_xml_xslt, xml_output)
        
        # Schritt 2: Füge <chapter>-Tags zum transformierten XML hinzu
        add_chapter_tags(xml_output) 

        # Schritt 3: Transformierte XML in XSL-FO konvertieren
        xslfo_output = os.path.join(xslfo_folder, f"{base_name}.fo")
        transform_xml(xml_output, xml_to_xslfo_xslt, xslfo_output)

        # Erfolgreiche Verarbeitung melden
        print(f"Datei '{file_name}' erfolgreich verarbeitet!")
        processed_files += 1

    # Überprüfen, ob keine Dateien verarbeitet wurden
    if processed_files == 0:
        print("Keine Datei im Input-Ordner.")

if __name__ == "__main__":
    main()
