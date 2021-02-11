

ntdsxtract()
{
	del_stopped ntdsxtract
	docker run --net=host --name ntdsxtract -v ./../pentest_data/:/secure/home/ -it ntdsxtract:latest "$@"
}