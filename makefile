include $(PQ_FACTORY)/factory.mk

build-stamp: stage-stamp
	$(MAKE) -C ../src build
	$(MAKE) -C ../src install DESTDIR=$(stage_dir) PART_DIR=$(part_dir)
	touch $@

clean-stamp:
	$(MAKE) -C src clean
