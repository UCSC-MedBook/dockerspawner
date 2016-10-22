FROM jupyterhub/singleuser
USER root
ENV NB_USER="root"
ENV HOME="/home/root"
WORKDIR "/home/root/work"
RUN pip install pymongo
RUN pip2 install pymongo