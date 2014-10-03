all: clean start 

clean: 
	vagrant destroy --force

start: 
	vagrant up && \
	vagrant ssh --command 'bash /vagrant/dev/run.sh'

