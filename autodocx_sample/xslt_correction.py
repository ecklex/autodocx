import os
from lxml import etree

# Ordnernamen definieren
xml_folder = "XML"
xslfo_folder = "XSL-FO"
xslt_folder = "XSLT"

# XSLT-Datei
xml_to_xslfo_xslt = os.path.join(xslt_folder, "XML-to-XSLFO.xslt")

def transform_xml(input_xml, xslt_path, output_xml):
    # Transformiert eine XML-Datei mit einer XSLT-Datei.
    xslt_tree = etree.parse(xslt_path)
    transform = etree.XSLT(xslt_tree)

    input_tree = etree.parse(input_xml)
    result_tree = transform(input_tree)

    result_tree.write(output_xml, pretty_print=True, encoding="utf-8")

def main():
    for file_name in os.listdir(xml_folder):
        if file_name.endswith(".xml") and "impressum" not in file_name and "widmung" not in file_name:
            input_xml_path = os.path.join(xml_folder, file_name)

            # Transformierte XML in XSL-FO konvertieren
            base_name = os.path.splitext(file_name)[0]
            xslfo_output = os.path.join(xslfo_folder, f"{base_name}.fo")
            transform_xml(input_xml_path, xml_to_xslfo_xslt, xslfo_output)

if __name__ == "__main__":
    main()