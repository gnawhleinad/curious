#/bin/bash -eux

CIDFILE=/var/lock/curious/node.cid

cd /vagrant && \
([ -f $CIDFILE ] && (docker stop `cat $CIDFILE` && rm -f $CIDFILE) || true) && \
docker build -t curious/node . && \
docker run -d -p 8080:8080 --cidfile $CIDFILE curious/node

