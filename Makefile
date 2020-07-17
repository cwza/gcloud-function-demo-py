test:
	python -m unittest

test-curl:
	curl "http://127.0.0.1:5000/entry?str1=hello&str2=world"

deploy:
	gcloud functions deploy gcloud-function-demo-py --entry-point entry \
		--runtime python37 --trigger-http --max-instances 1 --memory 128MB --allow-unauthenticated --env-vars-file .gcloudenv.yaml