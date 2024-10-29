from docx import Document

def docx_to_xml(docx_path, xml_path):
    doc = Document(docx_path)
    xml_content = ""

    # Styles to convert
    for paragraph in doc.paragraphs:
        style_name = paragraph.style.name
        paragraph_xml = ""  # Initialize for the paragraph

        # Iterate over runs within the paragraph to check for inline formatting
        for run in paragraph.runs:
            run_text = run.text
            
            # Apply italic formatting (check both direct italic attribute and style-based character formatting)
            if run.italic or (run.style and 'italic' in run.style.name.lower()):
                run_text = "<i>{}</i>".format(run_text)
            if run.style.name == 'Standard kursiv2':
                run_text = "<i>{}</i>".format(run_text)

                
            if run.font.italic == True:
                run_text = "<i>{}</i>".format(run_text)
            
            # Apply bold formatting
            if run.bold:
                run_text = "<b>{}</b>".format(run_text)

            # Add run text to paragraph XML content
            paragraph_xml += run_text

        # Now check the style of the paragraph and wrap the entire content. Enter your style names if needed.
        if style_name == 'Titel':
            xml_content += "<title>{}</title>".format(paragraph_xml)
        elif style_name == 'Untertitel':
            xml_content += "<subtitle>{}</subtitle>".format(paragraph_xml)
        elif style_name == 'Überschrift 1':
            xml_content += "<h1>{}</h1>".format(paragraph_xml)
        elif style_name == 'Standard':
            xml_content += "<p>{}</p>".format(paragraph_xml)
        elif style_name == 'ListBullet':
            xml_content += "<ul><li>{}</li></ul>".format(paragraph_xml)
        elif style_name == 'Listenabsatz1':
            xml_content += "<ol><li>{}</li></ol>".format(paragraph_xml)
            


    # Replace special characters
    xml_content = xml_content.replace("&", "&amp;")

    # delete empty lines
    xml_content = xml_content.replace("<p></p>", "")

    # save xml file
    with open(xml_path, "w") as xml_file:
        xml_file.write("<?xml version='1.0' encoding='UTF-8'?>\n")
        xml_file.write("<?xml-stylesheet type='text/css' href='/Path_to_your/print.css'?>\n")
        xml_file.write("<document xml:lang='de'>{}</document>".format(xml_content))

# Replace 'input.docx' with the path to your input.docx file
# Replace 'output.xml' with the path where you want to save the XML file
docx_to_xml('input.docx', 'output.xml')
