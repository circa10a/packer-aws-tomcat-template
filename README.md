# packer-aws-tomcat-template

A packer template to build AMI's with apache tomcat installed and systemd enabled. Based on Amazon linux.

## Build

```shell
export AWS_ACCESS_KEY_ID=**************
export AWS_SECRET_ACCESS_KEY=**********

packer build build.json
```

## Variables

|                  |                                 |                                                                                                  |
|------------------|---------------------------------|--------------------------------------------------------------------------------------------------|
| Name             | Default                         | Description                                                                                      |
| `aws_access_key` | env var `AWS_ACCESS_KEY_ID`     | `AWS_ACCESS_KEY_ID` from IAM                                                                     |
| `aws_secret_key` | env var `AWS_SECRET_ACCESS_KEY` | `AWS_SECRET_ACCESS_KEY` from IAM                                                                 |
| `region`         | `us-east-1`                     | AWS Region to register AMI in                                                                    |
| `tomcat_version` | `9.0.30`                        | Version of tomcat to download from apache.org                                                    |
| `java_version`   | `1.8.0`                         | Version of java to install(via yum)                                                              |
| `install_dir`    | `/tomcat`                       | Directory to install tomcat in. Not recommended to change, service file will need to be updated. |
| `service_file`   | `./files/tomcat.service`        | Systemd unit file to install to manage the tomcat install                                        |

## Usage

Once AMI is created and launched, tomcat will be up and listening on port `8080` at the root context path(`/`).