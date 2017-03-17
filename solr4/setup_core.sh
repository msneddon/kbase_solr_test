#!/bin/bash




CORE=GenomeFeatures_ci
rm -rf cores/$CORE
cp -rv cores/GenomeFeatures_base cores/$CORE
curl "http://localhost:8983/solr/admin/cores?wt=json&indexInfo=false&action=CREATE&name=$CORE&instanceDir=%2Fcores%2F$CORE&dataDir=&config=solrconfig.xml&schema=schema.xml"

# load a few records
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/genomes/g1.json"
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/genomes/g2.json"

curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/features/f1.json"
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/features/f2.json"



CORE=GenomeFeatures_prod
rm -rf cores/$CORE
cp -rv cores/GenomeFeatures_base cores/$CORE
curl "http://localhost:8983/solr/admin/cores?wt=json&indexInfo=false&action=CREATE&name=$CORE&instanceDir=%2Fcores%2F$CORE&dataDir=&config=solrconfig.xml&schema=schema.xml"

# load a few records
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/genomes/g1.json"
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/genomes/g2.json"

curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/features/f1.json"
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/features/f2.json"



CORE=Genomes_ci
rm -rf cores/$CORE
cp -rv cores/GenomeFeatures_base cores/$CORE
curl "http://localhost:8983/solr/admin/cores?wt=json&indexInfo=false&action=CREATE&name=$CORE&instanceDir=%2Fcores%2F$CORE&dataDir=&config=solrconfig.xml&schema=schema.xml"

# load a few records
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/genomes/g1.json"
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/genomes/g2.json"

CORE=Genomes_prod
rm -rf cores/$CORE
cp -rv cores/GenomeFeatures_base cores/$CORE
curl "http://localhost:8983/solr/admin/cores?wt=json&indexInfo=false&action=CREATE&name=$CORE&instanceDir=%2Fcores%2F$CORE&dataDir=&config=solrconfig.xml&schema=schema.xml"

# load a few records
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/genomes/g1.json"
curl -H "Content-Type: application/json" "localhost:8983/solr/$CORE/update?wt=json" --data "@example_records/genomes/g2.json"
