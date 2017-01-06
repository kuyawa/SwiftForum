##
# Copyright IBM Corporation 2016
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

# Builds a Docker image with all the dependencies for compiling and running the SwiftForum application.

FROM ibmcom/swift-ubuntu:latest
MAINTAINER IBM Swift Engineering at IBM Cloud
LABEL Description="Docker image for building and running the SwiftForum application."

# Expose default port for Kitura
EXPOSE 8090

RUN mkdir /root/SwiftForum

ADD Sources /root/SwiftForum
ADD Package.swift /root/SwiftForum
ADD LICENSE /root/SwiftForum
ADD .swift-version /root/SwiftForum

RUN cd /root/SwiftForum && swift build

USER root
CMD ["/root/SwiftForum/.build/debug/SwiftForum"]
