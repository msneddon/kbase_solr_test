

Starts up 2 containers for local search testing:

1) solr v4.10 container (right now you have to manually load the cores, see solr4 directory)

2) The actual search service, which right now is a simplified fork of kbase/search.  This
could probably be added as a submodule, but for now, just check it out here like so:

    git clone -b clean-service-2 https://github.com/msneddon/search


To start, be sure you have checked out the clean-service branch of the search.  You should be able to start up the containers like so:

    docker-compose up -d --build

You can then access solr directly from either:

    http://localhost:8983/solr

You can access the search service through:

    https://localhost:7078

You should then be able to view docker logs from both solr and the search service to
see what's actually happening.


The cores for SOLR can be mounted into the container from the solr4/cores directory.  I have an example of the new GenomeFeatures_prod core base configuration that can be used by Solr.  To add it, copy the template:

    cp -r solr4/cores/GenomeFeatures_base solr4/cores/GenomeFeatures

Then run something like this:
    curl "http://localhost:8983/solr/admin/cores?wt=json&indexInfo=false&action=CREATE&name=GenomeFeatures_prod&instanceDir=%2Fcores%2FGenomeFeatures&dataDir=&config=solrconfig.xml&schema=schema.xml"