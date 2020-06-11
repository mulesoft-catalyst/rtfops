# rtfops

Anypoint Runtime Fabric Ops scripts

Following the KISS philosophy, one script (command) does one task and does it well, as the names suggest.

The scripts leverage Anypoint Platform REST APIs (CloudHub, Runtime Fabric and AMC - Anypoint Management Center, etc.) and lovely `curl` to do all the hard work ;-)

> The initial intention was to improve productivity when implementing and working with Runtime Fabric, mainly via CLI of course. However, as the scripts evolve over time they become building blocks for CI/CD pipelines, can also integrate into other automation workflows beautifully. 

`rtfops` scripts are actively maintained and constantly evolving.

## To-Do List

- [ ] Add support for associating RTF with Anypoint Platform Environments
- [ ] Add support for sharing RTF across Organisation's Business Groups
- [ ] Add support for basic Edge Ingress operations
- [ ] Add support for Secrets Manager
- [x] Add support for Disabling / Enabling Log Forwarding for Anypoint Monitoring


Happy Muley, happy Mule ;-)

# Usage

Set the environment variables in `env` file

```bash
# read the environment variables
source ./env

# get access token
./get_token.sh
Enter username: username
Enter password:
Bearer token: n55b30t0-2f87-42b5-911r-a31402ff44c6

export TOKEN="<bearer_token>"

# run the rtfops scripts
```

> NOTE: To avoid being dependent on the `env` file for setting environment variables, [`direnv`](https://direnv.net/) is highly recommended to enable per directory environment variables by leveraging a `.envrc` file, especially useful when working across multiple Org IDs.

# Reference

> NOTE: Runtime Manager -> Runtime Fabrics page now have a [Download page - authentication required](https://anypoint.mulesoft.com/cloudhub/#/console/home/runtimefabrics/artifacts) with all downloadable artifacts and release notes.

Anypoint Runtime Fabric Artifacts

- Install scripts (scripts to provision infrastructure on AWS and Azure, prepare each node and bootstrap a new RTF cluster)
- Installer package (RTF cluster components, including `k8s`, Docker as CRI, `flannel` as CNI plugin and the Ops Center. The installer can be used to apply upgrades to the cluster - Yes! It's `gravity`)
- rtfctl (A CLI util to manage RTF)

Anypoint Runtime Fabric Release Notes

- [Runtime Fabric - (essentially a helm chart named `rtf-agent` in `rtf` namespace)](https://docs.mulesoft.com/release-notes/runtime-fabric/runtime-fabric-release-notes)
- [Mule Runtime (containerized) Release Notes](https://docs.mulesoft.com/release-notes/runtime-fabric/runtime-fabric-runtimes-release-notes)
- [Runtime Fabric Installer (`gravity`) Release Notes](https://docs.mulesoft.com/release-notes/runtime-fabric/runtime-fabric-installer-release-notes)
- [Anypoint Security Edge Release Notes](https://docs.mulesoft.com/release-notes/anypoint-security/anypoint-security-rtf-edge)

> NOTE: Runtime release notes has the latest version tag info for each mule runtime version, which will be used to deploy applications via REST API (e.g. send as a part of the JSON body when sending a POST request to the AMC API endpoint).

`gravity` is self-contained k8s packaging solution. The installer includes k8s binaries and its dependencies, application container images, a private Docker registry, a monitoring and alerting system and an authentication gateway for remote management via k8s API or SSH.

Gravity 5.x monitoring is based on `heapster` + `influxdb` + `grafana`.

Gravity 7.x has adopted cutting edge `Prometheus` which uses `node-exporter` to collect hardware and OS metrics and `kube-state-metrics` to collect metrics about various `k8s` resources, `Grafana`, `Alertmanager` and Satellite.

---
```bash
**********************************************************************
*                                                                    *
*                         (((((((((((((((((((                        *
*                     (((((                 ((((#                    *
*                  &(((                        *(((                  *
*                &(((                             (((                *
*               (((     (((%               (((#     (((              *
*              ((     (((((((             (((((((    (((             *
*             ((     (((((((((           (((((((((     ((            *
*            ((    #(((((((((((        #(((((((((((    (((           *
*           #((    ((((((((((((((     ((((((((((((((    ((           *
*           ((    ((((((  /(((((((   (((((((  /((((((    ((          *
*           ((    ((((((    (((((((&(((((((    ((((((    ((          *
*           ((    (((((      ((((((((((((*     ((((((    ((          *
*           ((    ((((((      *(((((((((       ((((((    ((          *
*           ((    ((((((        (((((((        ((((((   (((          *
*            ((    ((((((                     ((((((    ((           *
*            ((#    ((((((#                 (((((((    ((            *
*             ((#    ((((((((             ((((((((    (((            *
*              (((    (((((((              (((((     ((.             *
*                ((      (((               (((     #((               *
*                 /((                            (((                 *
*                    (((                      &(((                   *
*                      *((((&             &((((                      *
*                           ((((((((((((((/                          *                                                                 
*                                                                    *
**********************************************************************
```
