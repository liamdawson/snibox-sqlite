# snibox-sqlite

Snibox container working with SQLite3 database for personal use

To build this container use following command:

```bash
git clone https://gitlab.com/pivpav/snibox-sqlite.git
docker build -t snibox ./snibox-sqlite
```

Alternatively you can pull ready to use image from [Docker Hub](https://hub.docker.com/r/snowmean/snibox-sqlite/)

```bash
docker pull snowmean/snibox-sqlite:latest
```

Default database file location is `/app/db/database/snibox.sqlite3`, but you can redefine its location by using environment variable `DATABASE`.

Container runs `rake db:migrate` on every start, in order to create database file if not exist, or update database scheme if required, so backups are highly recommended.

To run this container you might use following command:

```bash
docker run -d --name snibox \
              --volume /path/to/local/db:/app/db/database \
              --publish 80:3000 \
              --restart always \
              snowmean/snibox-sqlite
```

