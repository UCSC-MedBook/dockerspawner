FROM jupyterhub/singleuser
USER root
ENV NB_USER="root"
ENV HOME="/home/root"
WORKDIR "/home/root/work"
