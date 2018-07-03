Name: docker-gc
Version: %{version}
Release: 1%{?dist}
Summary: Docker garbage collection of containers and images.
BuildArch: noarch

License: Apache

%description
Docker garbage collection of containers and images.

%install
mkdir -p $RPM_BUILD_ROOT/usr/sbin
install -m 775 $RPM_SOURCE_DIR/docker-gc $RPM_BUILD_ROOT/usr/sbin/docker-gc

%files
/usr/sbin/docker-gc
