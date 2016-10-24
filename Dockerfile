# Build as jupyterhub/singleuser
# Run with the DockerSpawner in JupyterHub

FROM jupyter/datascience-notebook

MAINTAINER Project Jupyter <jupyter@googlegroups.com>

EXPOSE 8888

USER root
# fetch juptyerhub-singleuser entrypoint
RUN wget -q https://raw.githubusercontent.com/jupyterhub/jupyterhub/0.6.1/scripts/jupyterhub-singleuser -O /usr/local/bin/jupyterhub-singleuser && \
    chmod 755 /usr/local/bin/jupyterhub-singleuser

ADD singleuser/singleuser.sh /srv/singleuser/singleuser.sh
USER root
ENV NB_USER="root"
ENV HOME="/home/root"
WORKDIR "/home/root/work"
# smoke test that it's importable at least
RUN sh /srv/singleuser/singleuser.sh -h

RUN pip install pymongo
RUN pip2 install pymongo
CMD ["sh", "/srv/singleuser/singleuser.sh"]
