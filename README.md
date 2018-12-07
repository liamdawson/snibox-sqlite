# snibox-sqlite

Snibox container working with SQLite3 database for personal use

To build this container use following command:

```bash
git clone https://gitlab.com/pivpav/snibox-sqlite.git
docker build -t snibox ./snibox-sqlite
```

Alternatively you can use ready to use image

```bash
docker pull snowmean/snibox-sqlite:latest
```

To run this container use following parameters:

```bash
docker run -d --name snibox \
              --volume /path/to/local/db:/app/db/database \
              --publish 80:3000 \
              --restart always \
              snibox
```

Default database file location is `/app/db/database/snibox.sqlite3`, however you can redefine it by using environment variable `DATABASE`.

Container is running `rake db:migrate` on every start, in order to either create database if not exist, or update database scheme if required, so backups are highly recommended.