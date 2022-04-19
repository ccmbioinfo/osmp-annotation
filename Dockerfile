FROM python:3.9-slim
LABEL org.opencontainers.image.title OSMP Annotation
LABEL org.opencontainers.image.authors giabaohan.le@sickkids.ca
LABEL org.opencontainers.image.source https://github.com/ccmbioinfo/osmp-annotation
LABEL org.opencontainers.image.vendor Centre for Computational Medicine

WORKDIR /usr/app

# Install Python requirements
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Install tabix
RUN apt-get update && apt-get install -y tabix

#install node.js
RUN apt-get update && apt-get install -y nodejs npm wget && npm i -D @types/node

#install liftover
RUN wget -O /usr/local/bin/liftOver https://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/liftOver  \
    && chmod +x /usr/local/bin/liftOver

