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