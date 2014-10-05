#/bin/bash -eux

LOCKDIR=/var/lock/curious
CIDFILE=$LOCKDIR/node.cid

USER=$(whoami)
GROUP=$(id -gn)

[ ! -d $LOCKDIR ] && sudo mkdir -p $LOCKDIR && sudo chown -R $USER:$GROUP $LOCKDIR

cd /vagrant && \
([ -f $CIDFILE ] && (docker stop `cat $CIDFILE` && rm -f $CIDFILE) || true) && \
docker build -t curious/node . && \
docker run -d -p 8080:8080 --cidfile $CIDFILE curious/node

