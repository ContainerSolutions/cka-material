# Scheduling
## Preparation
In order to run these practice exercises, have minikube installed. you can then start minikube with

```
minikube start
```

After that, check that your kubectl is currently pointed to minikube environment. this can be done with

```
kubectl get-contexts
```

Run the command below to mess with minikube scheduler

```
bash pre_script.sh
```

<details>
  <summary>Command content</summary>
  This command changes manifests definitions for kube-scheduler.yaml it is base64 encoded, but runs the following lines:
  <details>
   <summary>Command lines (Spoiler)</summary>

    pre_script.sh: minikube ssh --native-ssh=false -- sudo mv /etc/kubernetes/manifests/kube-scheduler.yaml /etc/kubernetes/kube-scheduler.yaml

    post_script.sh: minikube ssh --native-ssh=false -- sudo mv /etc/kubernetes/kube-scheduler.yaml /etc/kubernetes/manifests/kube-scheduler.yaml
</details>
</details>


## Exercise 1
* Create a nginx pod with image nginx. Why is it not running?

* Manually assign the pod to a minikube node. Make sure the pod ends up running.

## Exercise 2

* try to fix the issue in the cluster yourself. You can ssh to the node with `minikube ssh`. You can fix it with `bash post_script.sh` if you like to skip this exercise.

## Exercise 3
* Taint the node `minikube` with the taint on-maintenance=yes:NoExecute. What happens to the pods created before?

* Create a pod called nginx-tol with image nginx and tolerations for the specified taint above. Make sure the pod  is running

* Remove the taint from `minikube` node. Are all pods back to running? Why?


## Exercise 4
* Create pod `box-pod` from yaml file `pod_ex3.yml`. There is something wrong with it. Fix it without changing the file definition.

<details>
   <summary> Hint </summary>
   Try labelling the node  with kubectl label nodes
</details>
