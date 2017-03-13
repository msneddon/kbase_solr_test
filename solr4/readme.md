
1) clone this repo

2) build or pull solr4 image

    docker pull msneddon/solr4.10
    docker build . -t msneddon/solr4.10

3) start solr

    SOLR_CONTAINER=solr4
    docker run --name $SOLR_CONTAINER -v $PWD/cores:/cores -d -p 8983:8983 msneddon/solr4.10

4) view the admin console here:

    http://localhost:8983/solr

5) to explore the solr container:

    docker exec -i -t $SOLR_CONTAINER /bin/bash

6) create the cores directory

    cp -r cores/GenomeFeatures_base cores/GenomeFeatures

7) create the core in the admin console (probably a CLI way to do this too)

    name: GenomeFeatures
    instanceDir: /cores/GenomeFeatures

    everything else can be left as default


8) load data

    cd example_records/genomes
    curl -H "Content-Type: application/json" 'localhost:8983/solr/GenomeFeatures/update?wt=json' --data "@g1.json"

9) To stop and kill the container

    docker stop $SOLR_CONTAINER
    docker rm $SOLR_CONTAINER