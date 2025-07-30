FROM n8nio/n8n:1.102.1

USER root
RUN apk add --update python3 py3-pip
COPY yt_search.py /usr/local/bin/

USER node
RUN python3 -m pip install --user --break-system-packages pipx
RUN python3 -m pip install --user --break-system-packages yt_dlp 


ENV PATH="/home/node/.local/bin:$PATH"
