FROM naturalselect/electronpod:latest
LABEL "Maintainer"="NaturalSelect<2145973003@qq.com>"
USER user
WORKDIR ${HOME}
RUN mkdir Noname
WORKDIR ${HOME}/Noname
RUN wget https://github.com/libccy/noname/releases/download/chromium77-client/Noname-linux-x64.zip
RUN unzip -O utf-8 ./Noname-linux-x64.zip
RUN  mv ./无名杀 ./Noname && chmod +x ./Noname
ENTRYPOINT [ "./Noname" ]