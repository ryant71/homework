# Homework

Naturally, this code must be written by you alone, but you may use the internet to solve various aspects as required, as would be done in day-to-day work. We appreciate you taking the time!

## Task 1

Please write a bash script which does the following:

Starting in the /opt directory, locate all directories which contain a file called .prune-enable

In those directories, delete any files named crash.dump

In those directories, for any file having the suffix ".log", if the file is larger than one megabyte, replace the file with a file containing only the last 20,000 lines.

## Task 2

Please write a script in python or another language of your choosing which calls a rest api at https://example.com/api/v1/programs (assume that this endpoint exists) that returns a json document like '[{"id":123,"name":"Jerks","rating":"14","year":2019,"plus_only":false},...]’

Please filter the results to contain only programs which are plus-only and have a rating of 16 and below.

Please print the name of each resulting program, and an additional line which mentions the total programs found, and how many met the criteria.

## Task 3

Please provide a Dockerfile to build a docker image.

The image should contain a webserver to serve static files that will be hosted in /opt/html.

The container should run without superuser rights.

Curl should also be installed in the container for testing purposes.

The exposed port should be configurable.
