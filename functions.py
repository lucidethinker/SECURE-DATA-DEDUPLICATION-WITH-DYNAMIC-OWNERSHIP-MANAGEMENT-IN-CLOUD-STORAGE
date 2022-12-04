import PyPDF2
import spacy

def pdfreader(path):


	pdfFileObj = open(path, 'rb')
	pdfReader = PyPDF2.PdfFileReader(pdfFileObj)
	pdfReader.numPages

	pageObj = pdfReader.getPage(0)
	pageObj.extractText()
	return pageObj.extractText()
def docreader(path):
	from docx import Document
	document = Document(path)
	for para in document.paragraphs:
		return para.text
def txtreader(path):
	
	filepath =path
	data = ""
	with open(filepath) as fp:
		line = fp.readline()
	# print(line)
		cnt = 1
		while line:
		# print(line)
			data = data + line
			line = fp.readline()
			cnt += 1

		return data
