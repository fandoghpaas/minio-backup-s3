
[license-image]: https://img.shields.io/badge/license-MIT-blue.svg
[license-url]: https://github.com/fandoghpaas/minio-backup-s3/blob/master/LICENSE

[docker-image]: https://img.shields.io/docker/pulls/fandoghpaas/minio-backup-s3.svg
[docker-url]: https://hub.docker.com/r/fandoghpaas/minio-backup-s3/

# MinIO Backup S3
`minio-backup-s3` is a service giving you ability to mirror entities from `SOURCE OBJECT STORAGE` to `DESTINATION OBJECT STORAGE`.

## Docker

```sh
$ docker run -e MC_HOST_SOURCE=https://<Access Key>:<Secret Key>@<YOUR-S3-ENDPOINT> -e MC_HOST_DESTINATION=https://<Access Key>:<Secret Key>@<YOUR-S3-ENDPOINT> fandoghpaas/minio-backup-s3:<IMAGE_VERSION>
```


## [Fandogh PaaS](https://docs.fandogh.cloud) Manifest
Copy below manifest in a YAML file and enter `fandogh service apply -f <FILE_NAME>.yml`
```
kind: InternalService
name: minio-backup
spec:
  image: _/fandoghpaas/minio-backup-s3:1.0.0
  image_pull_policy: Always
  env:
  - name: MC_HOST_SOURCE
    value: http://<Access Key>:<Secret Key>@<source-minio-service-name>
  - name: MC_HOST_DESTINATION
    value: http://<Access Key>:<Secret Key>@<destination-minio-service-name>
```

## Variable Table

>  **Before deployment** value of `variables` mentioned in this table should be overwritten with values of your choice.

|Variable | Description |
|--- |--- |
|**MC_HOST_SOURCE** | Choose source MinIO endpoint url
|**MC_HOST_DESTINATION** | Choose destination MinIO endpoint url
|**SCHEDULE** | backup schedule time for cronjob, see explanations below


## SCHEDULE
You can set the `SCHEDULE` environment variable like `-e SCHEDULE="@daily"` or `-e SCHEDULE="0 0 */4 * * *"` to run the backup automatically.

> If you don't enter SCHEDULE env, container will perform its actions only one time and terminate!

More information about the scheduling can be found [here](http://godoc.org/github.com/robfig/cron#hdr-Predefined_schedules).

