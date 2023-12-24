FROM naturalselect/electronpod:latest
LABEL "Maintainer"="NaturalSelect<2145973003@qq.com>"
USER user
WORKDIR ${HOME}
RUN mkdir Noname
WORKDIR ${HOME}/Noname
# Download game
RUN wget https://github.com/libccy/noname/releases/download/chromium77-client/Noname-linux-x64.zip
# Download resource files
RUN wget https://github.com/libccy/noname/archive/refs/tags/chromium77-client.tar.gz
RUN unzip -O utf-8 ./Noname-linux-x64.zip
RUN  mv ./无名杀 ./Noname && chmod +x ./Noname
COPY "identity.js" "./identity.js"
COPY "install_resource.sh" "./install_resource.sh"
RUN "./install_resource.sh"
RUN rm Noname-linux-x64.zip && rm ./install_resource.sh
COPY "entry_point.sh" "./entry_point.sh"
ENTRYPOINT [ "./entry_point.sh" ]