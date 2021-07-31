FROM phusion/passenger-customizable:latest

RUN /pd_build/python.sh && \
    /pd_build/nodejs.sh

RUN apt-get -y install python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER app

RUN cd /home/app && \
    npm install sass && \
    mkdir pdock && cd pdock && \
    mkdir cache content draft output plugins themes

ENV SASS_BIN=/home/app/node_modules/sass/sass.js
ENV PATH=/home/app/.local/bin:$PATH

WORKDIR /home/app/pdock

COPY --chown=app:app ./content/scripts /home/app/

COPY --chown=app:app ./content/Makefile /home/app/pdock/

COPY --chown=app:app ./content/requirements.txt /home/app/pdock/

RUN pip3 install -r requirements.txt

CMD [ "/home/app/develop_server.sh", "restart" ]

ENTRYPOINT [ "/home/app/entrypoint.sh" ]