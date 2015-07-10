Elements access service for MET API
=======================================

This module implements a service for reading metadata about elements.

Setup
-----

This application uses a Solr/Lucene server to read and write elements
metadata. In order for this to work, you will need to specify the
Solr server to use. This is given with the configuration key
`solr.elements`.

By default, this is set to localhost:

  met.solr.elements="http://localhost:8983/solr/elements"

If you want to test the application, you can set up a local Solr server,
with the Solr config specced in `/test/resources/solr`. Sample
documents are available in `/test/resources/elements.json` (insert
each json object individually).
