Name:     R-fake
Version:  1
Release:  1%{?dist}
Summary:  Fakes the installation of the R and R-devel packages
Epoch:    99
License:  BSD

BuildArch: noarch

Provides: R-KernSmooth
Provides: R-MASS
Provides: R-Matrix
Provides: R-base
Provides: R-boot
Provides: R-class
Provides: R-cluster
Provides: R-codetools
Provides: R-core
Provides: R-datasets
Provides: R-foreign
Provides: R-grDevices
Provides: R-graphics
Provides: R-grid
Provides: R-lattice
Provides: R-methods
Provides: R-mgcv
Provides: R-nlme
Provides: R-nnet
Provides: R-parallel
Provides: R-rpart
Provides: R-spatial
Provides: R-splines
Provides: R-stats
Provides: R-stats4
Provides: R-survival
Provides: R-tcltk
Provides: R-tools
Provides: R-utils
Provides: config(R-core)
Provides: libR.so()(%{__isa_bits}bit)
Provides: libRlapack.so()(%{__isa_bits}bit)
Provides: libRrefblas.so()(%{__isa_bits}bit)

Provides: R-devel

Provides: R-Matrix-devel
Provides: R-core-devel
Provides: pkgconfig(libR)

Provides: libRblas.so()(%{__isa_bits}bit)
Provides: openblas-Rblas

Provides: R-java-devel 

%description
Fakes the installation of the R and R-devel packages.
Useful if you have installed Microsoft R Open.

%prep

%build


%install


%files

%changelog
