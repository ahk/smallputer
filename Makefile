install:
	mkdir -p ${HOME}/bin && \
	rsync -av --exclude='Makefile' --exclude='.git' ./ ${HOME}/bin/
