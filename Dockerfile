FROM python:3.7-alpine
COPY requirements.txt /
RUN pip install -r /requirements.txt
COPY gdrive.py /
COPY downloads /
COPY key.json /
CMD ["python", "/gdrive.py"]