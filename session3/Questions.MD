Create a pod running a multi container pod with the following spec:


pod name: multi-container

container1 : c1
image: busybox
container 2 : c2
image: redis
container 3 : c3
imabe busybox

Make container 1 prints out `date` command to /var/log/current_date.log

Make container 3 prints /var/log/current_date.log content.



###


Create imperatively a pod named nginx with image nginx:1.16 and QoS Guaranteed with memory limit of 100Mi and CPU limit of 0.3




### 

Create a deployment named nginx with image nginx:1.16-alkine and replicas=3

Adjust the image to nginx:1.16-alpine and record the changes


