# syntax=docker/dockerfile:1

FROM python:3.10-slim

ENV DOCKER=TRUE

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
RUN pip3 install -r requirements.txt

COPY . .
EXPOSE 5000
CMD [ "python3", "flocap.py", "--listen"]