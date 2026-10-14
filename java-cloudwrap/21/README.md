# Java Cloudwrap - JRE 21

Base images for the Pennsieve JVM services:

| Image | Contents |
|---|---|
| `pennsieve/java-cloudwrap:21-jre-alpine-<commit>` | Eclipse Temurin 21 JRE on Alpine 3.24, cloudwrap, user `pennsieve` |
| `pennsieve/tomcat-cloudwrap:9-jre21-alpine-<commit>` | The above plus Apache Tomcat 9 in `/usr/local/tomcat` (the working directory), with an empty `webapps/` |

Both use `cloudwrap` as the entrypoint. `/usr/bin/java` links to the JRE, for
the services' run scripts that call it by that path.

These replace `java-cloudwrap/8` (Alpine 3.4, JRE 8), `java-cloudwrap/10`
(Debian buster/sid, JRE 10) and `tomcat-cloudwrap` (Alpine 3.9, JRE 8,
Tomcat 8.5), whose OS releases are end-of-life. Amazon Inspector cannot scan
the Debian sid image at all (`UNSUPPORTED_OS`).

The JRE 21 runtime rejects some JVM flags that JRE 8 only warned about, such
as `-XX:MaxPermSize`; remove them from a service's `JAVA_OPTS`/`CATALINA_OPTS`
before moving it to these images.

## Build

The `operations/build-docker-base-image` Jenkins job (`DIRECTORY=java-cloudwrap/21`)
builds both images and tags them with the commit it built. To build locally:

```bash
IMAGE_TAG=local docker compose build
```

To upgrade, change the pinned Alpine line, `CLOUDWRAP_VERSION` or
`TOMCAT_VERSION` (with their checksums) in the `Dockerfile`. A rebuild without
changes still picks up Alpine package fixes through `apk upgrade`.
