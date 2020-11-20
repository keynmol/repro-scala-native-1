FROM openjdk:8

RUN apt-get update

# Remove pre-bundled libunwind
RUN find /usr -name "*libunwind*" -delete

# Use pre-bundled clang
# ENV PATH=/usr/local/clang-5.0.0/bin:$PATH
# ENV CXX=clang++

RUN apt-get install make

RUN apt-get install -y clang g++

# Install Boehm GC and libunwind
RUN apt-get install -y libgc-dev libunwind8-dev

# Build and install re2 from source
RUN bash -xc "\
git clone https://code.googlesource.com/re2; \
pushd re2; \
git checkout 2017-03-01; \
make -j4 test; \
make install prefix=/usr; \
make testinstall prefix=/usr; \
popd; \
"

RUN curl -fLo cs https://git.io/coursier-cli-linux && \
    chmod +x cs && \
    ./cs

RUN ./cs install sbt

WORKDIR /src

ENV PATH="$PATH:/root/.local/share/coursier/bin"