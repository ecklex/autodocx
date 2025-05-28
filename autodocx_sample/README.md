# autodocx

This project provides a sample workflow for converting Word documents (docx) to structured XML and XSL-FO using XSLT transformations. The resulting files can be used for professional print layouts or further digital publishing processes.

## Table of Contents

- [autodocx](#autodocx)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Folder Structure](#folder-structure)
  - [Usage](#usage)
  - [Automatic Preface and Impressum](#automatic-preface-and-impressum)
  - [License](#license)
  - [Disclaimer](#disclaimer)
    - [AI Coding Project](#ai-coding-project)
    - [OS](#os)

## Features

- **WordXML Postprocessing:** Transforms WordXML documents (made in Word via ```save as```) into a custom XML structure using XSLT.
- **XML-to-XSLFO Transformation:** Converts the processed XML into XSL-FO for print-ready output.
- **Batch Processing:** Processes all XML files in the `Input` folder automatically.
- **Custom XSLT Stylesheets:** Easily adaptable for different document structures and layouts.

## Folder Structure

- `Input/` — Place your input `.xml` files here (exported from Word or other sources).
- `XML/` — Contains intermediate XML files after transformation.
- `XSL-FO/` — Output folder for generated XSL-FO files.
- `XSLT/` — Contains all XSLT stylesheets used for transformation.
- `ressources/` — Additional resources such as color profiles or logos.
- `Abbildungen/` — Place images referenced in your documents here.

## Usage

1. **Install dependencies:**
   ```pip install -r requirements.txt```

2. **Prepare your input files:**
* Place your Word-exported XML files in the Input/ folder.
3. **Run the processing script:**
```python xslt_process.py```
* This will generate processed XML files in /XML and XSL-FO files in /XSL-FO
4. **(Optional) Run correction script:**
* To re-transform existing XML files to XSL-FO, use:
```python xslt_correction.py```

## Automatic Preface and Impressum
To generate a Impressum automatically, use the ```impressum.xml```. It will be included as page in the generated XSL-FO file. 

**Requirements**
* Python 3.7+
* The scripts use ```lxml```library for XML and XSLT processing.
* The XSLT processor is compatible with the Oxygen XML Editor's built-in processor.

**Note:** The XSLT stylesheets are designed to work with the Oxygen XML Editor's processor. For best results, use Oxygen XML Editor for XSLT development and testing.

Note, that this is only a sample to give overview. 

## License
This project is for demonstration and educational purposes.

## Disclaimer
### AI Coding Project
This is an AI Coding Project. For overall scripts and vocabulary, GitHub-Copilot is used. 

### OS
Autodocx is tested on Mac/AppleOS. It should run on Linux or a Linux WSL on Windows. 