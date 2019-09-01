

parsedmarc()
{
	del_stopped parsedmarc
	docker run --net=host --name parsedmarc -v /secure/home/:/secure/home/ -it parsedmarc:latest "$@"
}