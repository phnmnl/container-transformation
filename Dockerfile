# Make sure this Docker file follow the PhenoMeNal Docker file guide at https://github.com/phnmnl/phenomenal-h2020/wiki/Dockerfile-Guide.
# Don't forget to update resource (CPU and memory) usage specifications in PhenoMeNal Galaxy container (see https://github.com/phnmnl/phenomenal-h2020/wiki/Setting-up-Galaxy-wrappers-on-PhenoMeNal-Galaxy-Container#tool-cpu-and-memory-usage-requests-and-limits) if necessary.

FROM container-registry.phenomenal-h2020.eu/phnmnl/rbase

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

ENV TOOL_NAME=transformation
ENV TOOL_VERSION=2.2.2
ENV CONTAINER_VERSION=1.2
ENV CONTAINER_GITHUB=https://github.com/phnmnl/container-transformation

LABEL version="${CONTAINER_VERSION}"
LABEL software.version="${TOOL_VERSION}"
LABEL software="${TOOL_NAME}"
LABEL base.image="container-registry.phenomenal-h2020.eu/phnmnl/rbase"
LABEL description="Transforms the dataMatrix intensity values."
LABEL website="${CONTAINER_GITHUB}"
LABEL documentation="${CONTAINER_GITHUB}"
LABEL license="${CONTAINER_GITHUB}"
LABEL tags="Metabolomics"

# Update, install dependencies, clone repos and clean
RUN apt-get update -qq  && \
    apt-get install --no-install-recommends -y git && \
    git clone -b v${TOOL_VERSION} https://github.com/workflow4metabolomics/transformation /files/transformation && \
    echo 'options("repos"="http://cran.rstudio.com")' >> /etc/R/Rprofile.site && \
    R -e "install.packages(c('batch','RUnit'), dependencies = TRUE)" && \
    apt-get purge -y git && \
    apt-get clean  && \
    apt-get autoremove -y  && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Make tool accessible through PATH
ENV PATH=$PATH:/files/transformation

# Make test script accessible through PATH
ENV PATH=$PATH:/files/transformation/runit

# Define Entry point script
ENTRYPOINT ["/files/transformation/transformation_wrapper.R"]
