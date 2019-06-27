

ntdsxtract()
{
	del_stopped ntdsxtract
	docker run --net=host --name ntdsxtract -v /secure/home/:/secure/home/ -it ntdsxtract:latest "$@"
}