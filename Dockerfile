FROM python:3.6.3-slim

ENV PATH /usr/local/bin:$PATH

WORKDIR /app

COPY  . /app

RUN apt-get update && apt-get -y update

RUN pip3 -q install pip --upgrade

RUN pip3 install jupyter
RUN pip3 --no-cache-dir install -r /app/requirements.txt

EXPOSE 8080

VOLUME /app/data

CMD  ["echo","stroke-prediction-model start container"]

CMD ["jupyter","notebook","stroke-prediction-model.ipynb","--ip='*'","--port=8888","--no-browser","--allow-root"]

