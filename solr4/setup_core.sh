#!/bin/bash

rm -rf cores/GenomeFeatures
cp -rv cores/GenomeFeatures_base cores/GenomeFeatures


CORE=GenomeFeatures_prod
curl "http://localhost:8983/solr/admin/cores?wt=json&indexInfo=false&action=CREATE&name=$CORE&instanceDir=%2Fcores%2FGenomeFeatures&dataDir=&config=solrconfig.xml&schema=schema.xml"

# load a few records
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/genomes/g1.json"
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/genomes/g2.json"

curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/features/f1.json"
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/features/f2.json"