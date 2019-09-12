# rtfops

Anypoint Runtime Fabric Ops scripts

Following the KISS philosophy, one script (command) does one task and (mean to) do it well, as the names suggest.

NOTE: The scripts leverage Anypoint Platform REST APIs (CloudHub, Runtime Fabric and AMC - Anypoint Management Center, etc.) and lovely `curl` to do all the hard work ;-)

`rtfops` scripts are actively maintained and constantly evolving.

Happy Muley, happy Mule ;-)

# Reference

Anypoint Runtime Fabric Release Notes

- [Runtime Fabric - (essentially a helm chart named `rtf-agent` in `rtf` namespace)](https://docs.mulesoft.com/release-notes/runtime-fabric/runtime-fabric-release-notes)
- [Mule Runtime (containerized) Release Notes](https://docs.mulesoft.com/release-notes/runtime-fabric/runtime-fabric-runtimes-release-notes)
- [Runtime Fabric Installer (`gravity`) Release Notes](https://docs.mulesoft.com/release-notes/runtime-fabric/runtime-fabric-installer-release-notes)

> NOTE: Runtime release notes has the latest version tag info for each mule runtime version, which will be used to deploy applications via REST API (e.g. send as a part of the JSON body when sending a POST request to the AMC API endpoint).

> NOTE: `gravity` is self-contained k8s packaging solution. The installer includes k8s binaries and its dependencies, application container images, a private Docker registry, a monitoring and alerting system (based on `heapster` + `influxdb` + `grafana` for 5.x, 6.x has moved to cutting edge Prometheus, Grafana, Alertmanager and Satellite) and an authentication gateway for remote management via k8s API or SSH.

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
