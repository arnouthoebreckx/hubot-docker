# Docker version 1.12.5
# We'll be using a base nodejs 7 docker image that I created earlier

FROM tourna/nodejs
MAINTAINER Arnout Hoebreckx, arnouthoebreckx@gmail.com

# We'll set the working directory
WORKDIR /opt/botdir

# We'll install coffee-script because huBot uses this
RUN apt-get install redis-server -y
RUN npm install -g coffee-script

CMD bin/hubot -a slack
