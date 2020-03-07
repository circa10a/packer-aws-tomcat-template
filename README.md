# packer-aws-tomcat-template

A packer template written in HCL to build AMI's with apache tomcat installed and systemd enabled. Based on Amazon linux.

[![Build Status](https://travis-ci.org/circa10a/packer-aws-tomcat-template.svg?branch=master)](https://travis-ci.org/circa10a/packer-aws-tomcat-template)

## Build

```shell
export AWS_ACCESS_KEY_ID=**************
export AWS_SECRET_ACCESS_KEY=**********

packer build \
    -var aws_access_key='"$AWS_ACCESS_KEY_ID"' \
    -var aws_secret_key='"$AWS_SECRET_ACCESS_KEY"' \
    .
```

## Variables

|                  |                                 |                                                                                                  |
|------------------|---------------------------------|--------------------------------------------------------------------------------------------------|
| Name             | Default                         | Description                                                                                      |
| `aws_access_key` | None                            | `AWS_ACCESS_KEY_ID` from IAM                                                                     |
| `aws_secret_key` | None                            | `AWS_SECRET_ACCESS_KEY` from IAM                                                                 |
| `region`         | `us-east-1`                     | AWS Region to register AMI in                                                                    |
| `tomcat_version` | `9.0.30`                        | Version of tomcat to download from apache.org                                                    |
| `java_version`   | `1.8.0`                         | Version of java to install(via yum)                                                              |
| `install_dir`    | `/tomcat`                       | Directory to install tomcat in. Not recommended to change, service file will need to be updated. |
| `service_file`   | `./files/tomcat.service`        | Systemd unit file to install to manage the tomcat install                                        |

## Usage

Once AMI is created and launched, tomcat will be up and listening on port `8080` at the root context path(`/`).
