FROM gapsystem/gap-docker-master

MAINTAINER The GAP Group <support@gap-system.org>

USER root

RUN     apt-get -qq install -y curl \
    &&  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
    &&  apt-get install -yq nodejs && npm install -g npm

USER gap

RUN     cd /home/gap/inst/gap-master/pkg \
    &&  git clone https://github.com/mcmartins/francy.git \
    &&  cd francy \
    &&  cd js \
    &&  sudo npm install && npm run build \
    &&  cd ../extensions/jupyter \
    &&  sudo npm install && npm run build \
    &&  sudo pip3 install -e . \
    &&  cd ../.. \
    &&  mv /home/gap/inst/gap-master/pkg/francy/extensions/jupyter/jupyter_francy/nbextension /home/gap/inst/gap-master/pkg/francy/extensions/jupyter/jupyter_francy/jupyter_francy \
    &&  jupyter nbextension install /home/gap/inst/gap-master/pkg/francy/extensions/jupyter/jupyter_francy/jupyter_francy --user \
    &&  jupyter nbextension enable jupyter_francy/extension --user

# Start at $HOME.
WORKDIR /home/gap

EXPOSE 8888

CMD jupyter notebook --no-browser --ip=0.0.0.0
