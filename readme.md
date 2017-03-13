

Starts up 3 containers for local search testing:

1) solr v4.10 container (right now you have to manually load the cores, see solr4 directory)

2) nginx container (needed to proxy solr to a new location, since kbase search service has
hard-coded paths to URL/search/... , while solr listens on URL/solr.

3) The actual search service, which right now is a simplified fork of kbase/search.  This
could probably be added as a submodule, but for now, just check it out here like so:

    git clone -b clean-service https://github.com/msneddon/search


To start, edit the docker-compose.yml file to fill in the proper volume mount paths on your system
(because I couldn't easily find a way to inject the current directory).

Then be sure you have checked out the clean-service branch of the search.

Finally, you should be able to start up the containers

    docker-compose up -d --build

You can then access solr directly from either:

    http://localhost:8983/solr/
    http://localhost:7077/search/   (goes through nginx, you need the trailing slash
                                     because my nginx skillz aren't great)

You can access the search service through:

    https://localhost:7078

You should then be able to view docker logs from both solr and the search service to
see what's actually happening.