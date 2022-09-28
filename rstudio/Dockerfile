FROM rocker/binder


USER root

COPY ./End-to-end-Execution-Demo.ipynb .

#RUN sudo usermod -aG sudo rstudio

RUN apt-get clean all && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    libxml2 \
    libodbc1 \
    python3-pip  \
    r-cran-pbdzmq \
    curl \
    gnupg

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update && \
  ACCEPT_EULA=Y apt-get install -y msodbcsql17

RUN Rscript -e "install.packages(c('rvest','RODBC'))"

RUN apt-get clean all && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]