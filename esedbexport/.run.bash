

esedbexport()
{
	del_stopped esedbexport
	docker run --net=host --name esedbexport -v /secure/home/:/secure/home/ -it esedbexport:latest "$@"
}