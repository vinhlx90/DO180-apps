#!/bin/bash
oc new-app --name nodejs-dev -i nodejs:16-ubi8 https://github.com/vinhlx90/DO180-apps#troubleshoot-review --context-dir=nodejs-app --build-env npm_config_registry=http://${RHT_OCP4_NEXUS_SERVER}/repository/nodejs
