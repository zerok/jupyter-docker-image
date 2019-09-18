FROM python:3.7-slim
LABEL MAINTAINER "Horst Gutmann <zerok@zerokspot.com>"
RUN mkdir -p /opt/setup/ && \
        apt-get update && \
        apt-get install -y graphviz graphviz-dev libfreetype6-dev gcc g++ make curl unzip && \
        rm -rf /var/lib/apt/lists/*

COPY requirements.txt /opt/setup/
RUN pip install -r /opt/setup/requirements.txt

COPY entrypoint.py /opt/setup/
RUN chmod +x /opt/setup/entrypoint.py

VOLUME "/data"

ENTRYPOINT ["/opt/setup/entrypoint.py"]
