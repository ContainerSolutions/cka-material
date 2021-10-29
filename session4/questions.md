###
Create a PV with type ReadWriteOnce storage of 100Mi using hostpath `/tmp/logs`


Run a pod named `processer` with image `busybox` in namespace `mynamespace` that writes the output of the command `ps -ef` to the file `/var/log/my.log` Make this file available at `/tmp/logs`

Find the file on the virtual machine.

Increase the capacity of the volume claim to 300Mi. What is going to happen ?

###

Create a serviceAccount named `mysa` in namespace `mynamespace` make sure that service account can `list,get` the resources `pods,deployments,services,persistentvolumeclaims` from `mynamespace` and `that-other-namespace`. 

Check if the permissions are appropriate.



###

Check when certificates expire on the cluster using kubeadm.

renew apiserver certificate


###

Create a ConfigMap with a custom index.html(https://github.com/ContainerSolutions/k8s-hackathon-files/blob/main/session_2/index.html) file
- Configmap name: front-end-content
- Configmap content: index.html file

Configure an nginx deployment with three replicas that mounts the configmap on `/usr/share/nginx/html`

Create a service called `nginx-service` that exposes this deployment as a `ClusterIp`

Create an ingress that exposes `nginx-service` on port 80