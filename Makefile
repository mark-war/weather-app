PROJECT_ID=devops-directive-argaam

run-local:
	docker-compose up

###

create-tf-backend-bucket:
	gsutil mb -p ${PROJECT_ID} gs://${PROJECT_ID}-terraform