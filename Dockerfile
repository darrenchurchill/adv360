FROM docker.io/zmkfirmware/zmk-build-arm:stable

WORKDIR /app

COPY config/west.yml config/west.yml

# Solution from google query: docker "fatal: the remote end hung up unexpectedly"
RUN git config --global http.postBuffer 100000000

# West Init
RUN west init -l config
# West Update
RUN west update
# West Zephyr export
RUN west zephyr-export

COPY bin/build.sh ./

CMD ["./build.sh"]
