# autodocx
a word-to-xml-to-print transformation project

## Description
*autodocx* will be a word-to-XML python script. It should transform a docx-file out into a plain XML-file using the [python-docx](https://github.com/python-openxml/python-docx) library by (c) Steve Canny.

Feedback is highly appreciated.

### subprocess
There is a clean_lists.py file in the subprocess directory. It is used to solve a problem with the list-transformation. It will be unnecessary in the future.

### printCSS
In order to style your XML, you can use CSS or, more specifically for the printing and book publishing process, PrintCSS. You'll find a CSS file in the directory. Just implement it's path to your XML file. It is then possible to print your XML styled via a browser (note, that different browsers act differently with the style information, some may not work on specific browsers at all).

## Requirements
This script is tested in an Windows 10 WSL Environment, which is the Linux Kernel running on Ubuntu ... Running on native Linux Ubuntu should be no problem. Runs on MacOS Sonoma 14.7 as well.

## How to use (so far)
1. Implement file path in the autodocx.py to where you have the input.docx. 
2. Implement file path in the autodocx.py to where you want to save the output.
3. Implement those paths to the clean_lists.py in the subprocess directory
4. Run.

Remember: To convert the .docx-file correctly, you need to format the Text with formatting templates and insert the template names into the right places in the script.

Note: Due to the on going process, the autodocx.py script may not match the input.docx provided all the time. I try to keep up. This means, that it could be possible, that the input.docx in this repository needs to be changed in order to run the script right away. 

## Troubleshooting
### single styles don´t get converted
Due to the way python-docx and word working, converting single styles may fail if the target style is not implemented in the document ([look here for further information](https://python-docx.readthedocs.io/en/latest/user/styles-understanding.html?highlight=understanding%20style)). To check if target style is implemented in your input-document (and therefore possible to find for the script), add the following argument anywhere in the script:
```
for style in document.styles:
    print("style.name == %s" % style.name)
```
This prints a list of all implemented styles in the document. If your style isn´t there, it won´t get converted. No error message or something else, it just won´t work.
#### fix
Just format some paragraphs with the desired style in the docx. This inserts the style into the docx. Problem solved.
