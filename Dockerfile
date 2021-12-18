FROM ligaard/jdk17-gradle73:latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git tmux wget && \
    mkdir /home/mineserver

WORKDIR /home/mineserver

RUN wget https://download.getbukkit.org/craftbukkit/craftbukkit-1.18.1.jar
    java -Xms1024M -Xmx2048M -jar craftbukkit-1.18.1.jar && \
    rm -r craftbukkit-1.18.1.jar eula.txt server.properties && \
    git clone https://github.com/dtsh4rk/mc-server.git && \
    cp mc-server/* /home/mineserver && rm -r mc-server

CMD ["bash"]
