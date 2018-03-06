#!/bin/bash

REPO=https://storage.reading-a.openstack.memset.com:8080/swift/v1/ca0c4540c8f84ad3917c40b432a49df8/MCAC/

for plugin in `curl $REPO | grep wgn`; do

ctx logger info "Uploading Plugin $plugin "
env -i cfy plugins upload  $REPO$plugin >> /tmp/cfy_status.txt 2>&1

done


#env -i cfy plugins upload "https://github.com/EarthmanT/cloudify-dblb/releases/download/0.2/cloudify_dblb-0.2-py27-none-linux_x86_64-centos-Core.wgn" >> /tmp/cfy_status.txt 2>&1
#env -i cfy plugins upload "https://github.com/cloudify-incubator/cloudify-awssdk-plugin/releases/download/1.2.0.3/cloudify_awssdk_plugin-1.2.0.3-py27-none-linux_x86_64-centos-Core.wgn" >> /tmp/cfy_status.txt 2>&1
#env -i cfy plugins upload "https://github.com/cloudify-cosmo/cloudify-aws-plugin/releases/download/1.5.1.2/cloudify_aws_plugin-1.5.1.2-py27-none-linux_x86_64-centos-Core.wgn" >> /tmp/cfy_status.txt 2>&1

env -i cfy blueprints upload -n update-blueprint.yaml -b "aws-example-network"        "https://github.com/cloudify-examples/aws-example-network/archive/master.zip"  >> /tmp/cfy_status.txt 2>&1 &
env -i cfy blueprints upload -n aws.yaml              -b "db"        "https://github.com/cloudify-examples/mariadb-blueprint/archive/master.zip"  >> /tmp/cfy_status.txt 2>&1 &
env -i cfy blueprints upload -n aws.yaml              -b "lb"        "https://github.com/cloudify-examples/haproxy-blueprint/archive/master.zip"  >> /tmp/cfy_status.txt 2>&1 &
env -i cfy blueprints upload -n openstack.yaml        -b "drupal"         "https://github.com/cloudify-examples/drupal-blueprint/archive/master.zip"  >> /tmp/cfy_status.txt 2>&1 &
env -i cfy blueprints upload -n blueprint.yaml        -b "db-lb-app"                "https://github.com/EarthmanT/db-lb-app/archive/master.zip"  >> /tmp/cfy_status.txt 2>&1 &
env -i cfy blueprints upload -n openstack.yaml        -b "k8s-e2e"                  "https://github.com/EarthmanT/e2e/releases/download/k8s-e2e-download/k8s-e2e.zip"  >> /tmp/cfy_status.txt 2>&1 &