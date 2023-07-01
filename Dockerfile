FROM python:3.11-slim-bookworm

RUN apt update && \
    apt install -y git wget unzip python3-websocket python3-aiohttp python3-jsonschema && \
    apt clean

ENV PYTHONPATH=/usr/lib/python3/dist-packages

RUN pip install git+https://github.com/HEnquist/pycamilladsp.git@v1.0.0 \
                git+https://github.com/HEnquist/pycamilladsp-plot.git@v1.0.2

WORKDIR /app

RUN wget https://github.com/HEnquist/camillagui-backend/releases/download/v1.0.1/camillagui.zip && \
    unzip camillagui.zip && \
    rm camillagui.zip

RUN mkdir -p ~/camilladsp/configs ~/camilladsp/coeffs

EXPOSE 5000

ENTRYPOINT [ "python", "main.py" ]
