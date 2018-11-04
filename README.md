# snibox-sqlite

Snibox container working with SQLite3 database for personal use

To build this container use following command:

```bash
git clone https://gitlab.com/pivpav/snibox-sqlite.git
cd snibox-sqlite
docker build -t snibox .
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

After first run you probably will see error due to database hasn't been initialized in the attached volume. Pleas run following command to create empty database:

```bash
docker exec <container_id> /app/bin/rails db:migrate
```

This will create new database instance and Snibox is ready to go.