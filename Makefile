CACHED :=

default: build

prepare: cache
	chmod 0755 .cache/bin/* rc/postgres

build: prepare
	docker build -t homeports/postgres:local .

clean:
	rm -fr .cache

CACHED += .cache/bin/init
.cache/bin/init:
	mkdir -p $$(dirname $@)
	curl -Lo $@ http://ci-niftylogic-com.s3.amazonaws.com/init-linux_amd64

CACHED += .cache/bin/rlog
.cache/bin/rlog:
	mkdir -p $$(dirname $@)
	curl -Lo $@ http://ci-niftylogic-com.s3.amazonaws.com/rlog-linux_amd64

cache: $(CACHED)

.PHONY: default prepare build clean cache
