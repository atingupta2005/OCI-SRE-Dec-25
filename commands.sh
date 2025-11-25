python -m venv venv
venv\Scripts\activate.bat
pip install -r requirements.txt

mkdocs new .
mkdocs serve
