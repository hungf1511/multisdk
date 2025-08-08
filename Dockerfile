FROM alpine:latest

RUN apk add --no-cache wget unzip

WORKDIR /usr/local/bin

# Tải và giải nén CastarSDK
RUN wget https://download.castarsdk.com/linux.zip -O castar.zip && \
    unzip castar.zip && rm castar.zip

# Tải và giải nén OnlinkSDK
RUN wget https://download.onlinksdk.com/20250709/onlineSDK_Linux.zip -O onlink.zip && \
    unzip onlink.zip && rm onlink.zip

# Tải và giải nén PacketSDK
RUN wget "https://storage-dl.packetsdk.com/d/packetsdk/linux/packet_sdk_linux-1.0.3.zip?sign=8qzS6oDZI3FdIrU-d9mQkTIQF2tLsi9YoXphzAB5-9o=:0" -O packet.zip && \
    unzip packet.zip -d packetsdk && rm packet.zip

# Copy file run.sh vào container
COPY run.sh /usr/local/bin/run.sh

# Cho phép thực thi
RUN chmod +x /usr/local/bin/run.sh

CMD ["/usr/local/bin/run.sh"]
