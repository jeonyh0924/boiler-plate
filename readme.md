# Boiler Plate

## Installation

### requirements

- python 3.8.2
- django 3.1.3

## Secretes
```
/proj
	/app
	/requirements.txt
	/readme.md
	/.secrets
		/base.json

# base.json
{
  "SECRET_KEY": "django key"
}
```


#### start dokcer file
```shell script
docker build -t <docker name> -f Dockerfile .
docker run --rm -it -p 7000:8000 <docker name>

```

#### s3 
```shell
1. AWS -IAM 사용자 생성  
2. 프로그래밍 방식 엑세스 선택
3. 그룹생성 - s3 full access

4. s3 버켓 생성

pip install django-storage
pip install boto3

# settings.py
STATICFILES_DIRS = [
    STATIC_DIR
]
STATIC_URL = '/static/'
MEDIA_URL = '/media/'


DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'
AWS_ACCESS_KEY_ID = SECRET_JSON['S3_ACCESS_KEY_ID']
AWS_SECRET_ACCESS_KEY = SECRET_JSON['S3_SECRET_ACCESS_KEY']
AWS_STORAGE_BUCKET_NAME = SECRET_JSON['S3_BUCKET_NAME']
AWS_AUTO_CREATE_BUCKET = True
AWS_S3_REGION_NAME = 'ap-northeast-2'

```