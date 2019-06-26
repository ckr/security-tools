include config.env
include deploy.env


all:
	-for d in $(DIRS); do (cd $$d; $(MAKE) ); done