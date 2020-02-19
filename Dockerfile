FROM python:3.7-slim
LABEL MAINTAINER "Horst Gutmann <zerok@zerokspot.com>"
RUN mkdir -p /opt/setup/ && \
        apt-get update && \
        apt-get install -y graphviz graphviz-dev libfreetype6-dev gcc g++ make curl unzip && \
        (curl -sL https://deb.nodesource.com/setup_12.x | bash -) && \
        apt-get install -y nodejs && \
        rm -rf /var/lib/apt/lists/*

COPY requirements.txt /opt/setup/
RUN pip install -r /opt/setup/requirements.txt && \
    jupyter nbextension enable --py widgetsnbextension && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager

COPY entrypoint.py /opt/setup/
RUN chmod +x /opt/setup/entrypoint.py

VOLUME "/data"

ENTRYPOINT ["/opt/setup/entrypoint.py"]
