## Session Links

Session video link: https://drive.google.com/file/d/1MXbktXdN87y3f0Jp4G4EdgY1LV8D4Axy/view?usp=drive_web

Slide Share: 

Links used during the session:

* [Scheduling Reference](https://kubernetes.io/docs/home/)
* [KubeAPI Reference](https://github.com/walidshaari/Kubernetes-Certified-Administrator?utm_source=pocket_mylist)


## Reproducing this session:

The session was recorded using two GCE VM instances.

You can have set up a two-cluster node either following session1 practice exercise, spinning up two VMs in your favorite cloud, or (if your local machine handles it), using minikube:

```
minikube start --nodes=2 
```

To access your Node with minikube, simply type `minikube ssh <node-name>`


### Command History
```language: bash
alias k=kubectl
k run mgx --image=nginx --dry-run=client -o yaml > ngx.yaml
k get nodes -o wide
k run nginx --image=nginx 
k delete pod mgx nginx
touch binding.json
nano binding.json
curl -X POST https://34.133.211.79:8080/api/v1/namespaces/default/pods/ngx/binding \\
  -H "Content-Type: application/json" \\
  -d @binding.json
curl -X POST https://34.133.211.79:6443/api/v1/namespaces/default/pods/ngx/binding \\
  -H "Content-Type: application/json" \\
  -d @binding.json
k get node
ls -l
k label node node01 app=nginx
#k taint node controlplane 
k describe node controlplane | grep -i taint
k taint node controlplane node-role.kubernetes.io/master:NoSchedule-\

k label node node01 node=master
k label node controlplane node=master
k label node node01 node=worker
k label node node01 node=worker --overwrite
k describe node controlplane | grep -i label
k describe node node01 | grep -i label
k describe node node01 | grep label
k describe node node01 | grep Label
k describe node node01
k describe node controlplane
nano ngx.yaml
k get pods
k delete pod ngx
k apply -f ngx.yaml
k get pods -o wide
k get pods --all-namespaces
```


## Practice tests

See practice folder.
