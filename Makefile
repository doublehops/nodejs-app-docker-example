build:
	docker build -t node_project:latest .

run:
	docker run -p8080:8080 -d node_project

push:
	./push-to-ecr.sh


