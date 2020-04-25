rg-graphql
==========

A appserver that puts a GraphQL API on top of the Neo4j database used by Restagraph, meaning you can use both APIs in parallel, depending on what you want to do.

It's a very simple Node app, based on Apollo Server, which fetches its schema from Restagraph's REST API on startup. This is as dynamic as I could get it to be, so if you update the Restagraph schema you'll need to restart this app for the changes to show up in the GraphQL API.


Dependencies
============

NodeJS version 10, because that's the version I could get this working in. It's possible it'll work in newer versions. Packages required:

- apollo-server
- graphql
- neo4j-graphql-js
- sync-request

Neo4j must be the `equill/neo4j-graphql` Docker image, or any equivalent you have on hand. It's Neo4j 3.5.3 with the APOC library installed.

It also depends on Restagraph, in case you hadn't already figured out that part.


Installation
============

It's a Node app: `npm install` each of the packages.


Running
=======

`node index.js` will start it up, but it depends on a few environment variables for initial configuration:

- `NEO4J_SERVER` = `host:port` for connecting to the Neo4j server via Bolt, e.g. `localhost:7687`
- `NEO4J_USER` = username for authenticating to Neo4j
- `NEO4J_PASSWD` = password for authenticating to Neo4j
- `RG_SERVER` = base URL for the Restagraph server, e.g. 'http://localhost:4950'

`start_node.sh` is a convenience script that I used while developing it. It reflects the Docker configs I use.
