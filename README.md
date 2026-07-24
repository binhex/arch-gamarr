# Application

[gamarr](https://github.com/binhex/gamarr)

## Description

gamarr is an automated PC game acquisition daemon written in Python. It scrapes
Metacritic for critically-acclaimed new releases, filters out unwanted genres
and keywords, matches titles against FitGirl repacks and FreeGOG, and
delivers torrents to qBittorrent. Once downloads complete, a post-processing
thread SHA-256-verifies and copies each game to your library with customizable
path templates, then cleans up source torrents.

## Build notes

Latest GitHub release.

## Usage

```bash
docker run -d \
    --name=<container name> \
    -v <path for config files>:/config \
    -v <path for media files>:/media \
    -v <path for data files>:/data \
    -v /etc/localtime:/etc/localtime:ro \
    -e GAMARR_LOG_LEVEL=INFO \
    -e GAMARR_LIBRARY_PATH=<library path> \
    -e GAMARR_QBT_HOST=<qbittorrent host> \
    -e GAMARR_QBT_PORT=<qbittorrent port> \
    -e GAMARR_QBT_USERNAME=<qbittorrent username> \
    -e GAMARR_QBT_PASSWORD=<qbittorrent password> \
    -e GAMARR_CONFIG_PATH=/config/gamarr/configs \
    -e GAMARR_DB_PATH=/config/gamarr/db \
    -e GAMARR_LOG_PATH=/config/gamarr/logs \
    -e GAMARR_PID_PATH=/config/gamarr/pids \
    -e ENABLE_STARTUP_SCRIPTS=yes|no \
    -e HEALTHCHECK_COMMAND=<command> \
    -e HEALTHCHECK_ACTION=<action> \
    -e HEALTHCHECK_HOSTNAME=<hostname> \
    -e UMASK=<umask for created files> \
    -e PUID=<uid for user> \
    -e PGID=<gid for user> \
    ghcr.io/binhex/arch-gamarr
```

Please replace all user variables in the above command defined by <> with the
correct values.

## Example

```bash
docker run -d \
    --name=gamarr \
    -v /apps/docker/gamarr:/config \
    -v /mnt/user:/media \
    -v /apps/docker/qbittorrent/data/completed:/data:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -e GAMARR_LOG_LEVEL=INFO \
    -e GAMARR_LIBRARY_PATH=/media/Games \
    -e GAMARR_QBT_HOST=binhex-qbittorrent \
    -e GAMARR_QBT_PORT=8080 \
    -e GAMARR_QBT_USERNAME=admin \
    -e GAMARR_QBT_PASSWORD=adminadmin \
    -e ENABLE_STARTUP_SCRIPTS=yes \
    -e UMASK=000 \
    -e PUID=0 \
    -e PGID=0 \
    ghcr.io/binhex/arch-gamarr
```

## Notes

User ID (PUID) and Group ID (PGID) can be found by issuing the following command
for the user you want to run the container as:-

```bash
id <username>
```

See the [gamarr README](https://github.com/binhex/gamarr) for full configuration
documentation and environment variable reference.

___
If you appreciate my work, then please consider buying me a beer  :D

[![PayPal donation](https://www.paypal.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MM5E27UX6AUU4)

[Documentation](https://github.com/binhex/documentation) | [Support forum](https://forums.unraid.net/topic/198851-support-binhex-gamarr/)
