

esedbexport()
{
	del_stopped esedbexport
	docker run --net=host --name esedbexport -v ./../pentest_data/:/secure/home/ -it esedbexport:latest "$@"
}