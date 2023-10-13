#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

kind load docker-image "shenyu-examples-alibaba-dubbo-service:latest"
kind load docker-image "apache/shenyu-integrated-test-k8s-ingress-alibaba-dubbo:latest"
kubectl apply -f ./shenyu-examples/shenyu-examples-dubbo/shenyu-examples-alibaba-dubbo-service/k8s/shenyu-zookeeper.yml
kubectl wait --for=condition=Ready pod -l app=shenyu-zk -n shenyu-ingress
kubectl apply -f ./shenyu-examples/shenyu-examples-dubbo/shenyu-examples-alibaba-dubbo-service/k8s/shenyu-examples-dubbo.yml
kubectl apply -f ./shenyu-integrated-test/shenyu-integrated-test-k8s-ingress-alibaba-dubbo/deploy/deploy-shenyu.yaml
kubectl apply -f ./shenyu-examples/shenyu-examples-dubbo/shenyu-examples-alibaba-dubbo-service/k8s/ingress.yml
