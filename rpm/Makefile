
.PHONY: rpm

rpm:
	mkdir -p BUILDROOT/
	rpmbuild \
		--define "version `< ../version.txt`" \
		--define "_topdir `pwd`" \
		--define "_sourcedir %{_topdir}/.." \
	    -ba ./docker-gc.spec

clean:
	rm -rfv BUILD BUILDROOT SPECS SRPMS RPMS
