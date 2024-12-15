# A Docker image for the [Stealth-Api](https://gitlab.com/cosmosapps/stealth-api)


### Building for Production

Before building for production, make sure you have 3 environment variables ready with the following content:

```
URL=https://stealth.gitro.xyz #your url here
KEY=somekey #see below how to get one
PORT=8080
```

> [!IMPORTANT]  
> Learn how to get an application key following this [guide](https://github.com/reddit-archive/reddit/wiki/OAuth2-Quick-Start-Example#first-steps)


> [!WARNING]  
> If you want to change port make sure to edit also this line in the Dockerfile
> ```sh
> EXPOSE 8080
> ```


### With Docker

Clone the repository, then build a Docker image with:
```shell
$ docker build -t gitgitro/stealth-api \
	--build-arg URL=https://stealth.gitro.xyz \
        --build-arg KEY=somekey \
	--build-arg PORT=8080 .
```

You can then run it by using:
```shell
$ docker run --restart unless-stopped -p 8080:8080 -d --name "stealth-api" gitgitro/stealth-api
```

We also have a `docker-compose.yml` file available. Use `docker compose up` if you want to start the stack, or `docker compose down` to bring it down. You can pass `--build` to `docker compose up` to rebuild the Docker image (useful if you've changed any of the environment variables) as well as `-d` to start it in dettached mode. You can read more about Docker Compose in general [here](https://docs.docker.com/compose/intro/compose-application-model/).

## License

This project is licensed under the AGPL-3.0 License, please see the [LICENSE](LICENSE) file for details.