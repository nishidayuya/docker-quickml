# A QuickML docker image based on official Debian image

[QuickML](http://0xcc.net/quickml/) is an easy-to-use mailing list system.

## Supported tags and respective `Dockerfile` links

* [`stretch`, `latest`](https://github.com/nishidayuya/docker-quickml/blob/master/Dockerfile)

Issues and pull-requests are available on [GitHub repository](https://github.com/nishidayuya/docker-quickml/).

## Usage

Run on 10025 port and store mailing lists to `./mls` directory.

```sh
$ docker run -p=10025:10025 -e=SMTP_HOST=smtp-server-host \
    -v=$PWD/mls:/var/lib/quickml \
    -d nishidayuya/quickml:stretch
```

For production use, we recommended to use `docker-compose`.

```sh
$ wget https://raw.githubusercontent.com/nishidayuya/docker-quickml/master/docker-compose.yml
<edit SMTP_HOST environment on docker-compose.yml>
$ docker-compose up -d
```

## Environments

| Name | Description |
| --------- | ----------- |
| `SMTP_HOST` | REQUIRED. SMTP server host. Hostname or IP address. |
| `SMTP_PORT` | SMTP server port. Defaults to `25`. |
| `DOMAIN` | SMTP domain. Defaults to value of `SMTP_HOST` environment. |
| `POSTMASTER` | Postmaster email address. Defaults to `postmaster@<value of DOMAIN>`. |
| `INFO_URL` | The URL to understand how to use QuickML. Defaults to empty string. |
| `MAX_MEMBERS` | Number of members limit per ML. Defaults to `100`. |
| `MAX_MAIL_LENGTH` | Mail size limit. Defaults to `102400` (100KiB). |
| `ML_LIFE_TIME` | ML life time. Seconds. Defaults to `2678400` (31 days). |
| `ML_ALERT_TIME` | ML alert time. Seconds. Defaults to `2592000` (30 days). |
| `AUTO_UNSUBSCRIBE_COUNT` | Auto unsubscribe count. Defaults to `5`. |
| `AUTHORIZED_CREATORS` | Email addresses which can create new ML. Defaults to empty (all email addresses are allowed). |
| `AUTHORIZED_CREATORS_LIST` | Path to `authorized_creators_list` file. |
| `MESSAGE_CATALOG` | Message catalog. Defaults to use English message catalog. If you want to use Japanese message catalog, set `/usr/share/quickml/messages.ja`. Other language message catalogs are welcome. |
| `DISTRIBUTE_ADDRESS` | Email address to receive copy of sent emails. |
| `REPORT_ADDRESS` | Email address to receive new ML notification. |
