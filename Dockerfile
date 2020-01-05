FROM python:3-alpine

RUN apk --update-cache add \
    gcc \
    musl-dev \
    git \
    py3-capstone

COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

RUN git clone https://github.com/volatilityfoundation/volatility3.git /volatility3
WORKDIR /volatility3
ENTRYPOINT ["python", "vol.py"]

