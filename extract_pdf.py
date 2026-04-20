import pypdf
import re

pdf_path = 'Journal_04 A Predictive Meta Model for Forecasting Stock Price using Time Series Data.pdf'
reader = pypdf.PdfReader(pdf_path)

content = []
for i in range(min(15, len(reader.pages))):
    content.append(reader.pages[i].extract_text())

full_text = '\n'.join(content)

# Define sections of interest
sections = ['ABSTRACT', 'METHODOLOGY', 'LIMITATIONS', 'CHALLENGES', 'CONCLUSION', 'FUTURE WORK']

print(f'--- FILE PATH: {pdf_path} ---\n')

for section in sections:
    print(f'--- {section} ---')
    pattern = re.compile(rf'{section}.*?(?={"|".join(sections[sections.index(section)+1:])}|$)', re.S | re.I)
    match = pattern.search(full_text)
    if match:
        print(match.group(0)[:1500].strip())
    else:
        print('Section not found specifically, searching via keywords...')
        # Fallback keyword search
        lines = full_text.split('\n')
        for i, line in enumerate(lines):
            if section in line.upper():
                print('\n'.join(lines[i:i+20]))
                break
    print('\n')

