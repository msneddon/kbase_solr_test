#!/bin/bash

rm -rf cores/GenomeFeatures
cp -rv cores/GenomeFeatures_base cores/GenomeFeatures


curl "http://localhost:8983/solr/admin/cores?wt=json&indexInfo=false&action=CREATE&name=GenomeFeatures_prod&instanceDir=%2Fcores%2FGenomeFeatures&dataDir=&config=solrconfig.xml&schema=schema.xml"

# load one record
curl -H "Content-Type: application/json" 'localhost:8983/solr/GenomeFeatures_prod/update?wt=json' --data "@example_records/genomes/g1.json"