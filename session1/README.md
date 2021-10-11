## Session Links

Session video link: https://drive.google.com/file/d/1J1i1vjvaV2E4CSSsM2ew1KhJuX_IkmBJ/view?usp=drive_web

Links used during the session:

* [Kubernetes Docs](https://kubernetes.io/docs/home/)
* [Walidshaari Guide](https://github.com/walidshaari/Kubernetes-Certified-Administrator?utm_source=pocket_mylist)
* [Certification Site](https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/)


## Reproducing this session:

First of all, install [vagrant](https://www.vagrantup.com/docs/installation) in your local machine using the appropriate package manager.

After that, just do
```
cd vagrant
vagrant up master-1
```

After the machine is provisioned, just type ` vagrant ssh master-1 ` and you're ready to repeat the commands ran in this session.

### Command History
```language: bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-get install docker.io -y
sudo kubeadm config images pull
sudo kubeadm init
# Wont work because of not configured cgroup driver
sudo journalctl -xeu kubelet
sudo apt-get install -y kubelet=1.21.0-00 kubeadm=1.21.0-00 kubectl=1.21.0-00 --allow-downgrades
sudo kubeadm reset
#Now it works!
sudo kubeadm init
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
kubectl get pods -A
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl get pods -A
kubectl describe pod -n kube-system kube-flannel-ds-t2rst
kubectl logs -n kube-system kube-flannel-ds-t2rst
sudo kubeadm reset
sudo kubeadm init --pod-network-cidr=10.1.0.0/24
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl get pods -A
kubectl run nginx --image=nginx
kubectl get pods -A
kubectl describe pods nginx
kubectl get nodes
kubectl get pod -o yaml nginx > pod.yaml
#Adding a toleration to master Taint : NoSchedule
vi pod.yaml 
kubectl apply -f pod.yaml 
kubectl describe node master-1
#[NOT SAFE FOR PRODUCTION ENVIRONMENTS] - Alternatively, remove the taint from master-1
kubectl taint master-1 node-role.kubernetes.io/master:NoSchedule-
kubectl taint node master-1 node-role.kubernetes.io/master:NoSchedule-
kubectl run nginx2 --image=nginx
kubectl get pods -A
```

## Session "Good Script"
```
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet=1.21.0-00 kubeadm=1.21.0-00 kubectl=1.21.0-00 --allow-downgrades
sudo kubeadm init --pod-network-cidr=10.1.0.0/24
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl run nginx --image=nginx
kubectl get pod -o yaml nginx > pod.yaml
vi pod.yaml  # and add a new toleration.
```

## Practice tests

After having node `master-1` up, bring up node `worker-1` with `vagrant up worker-1`. You can access `worker-1` with `vagrant ssh worker-1`


Install kubeadm and join worker node `worker-1` into the cluster we just deployed.  Will it work? Are there any necessary steps that need to be done?

<details>
  <summary>Hint</summary>
  Only using <b>kubeadm join</b> from the worker node won't work, because kube-apiserver on <i>master-1</i> is only being advertised to an ip address that <i>worker-1</i> cannot reach. In order to make <i>master-1</i> available for worker-1, you should add the flag <b>--apiserver-advertise-address=192.168.5.11</b> to kubeadm init (can you find out why this ip address?).
  ```  
</details>


## Disclaimer

This vagrant file used in this session is provided by a port of kubernetes hard way to vagrant by @mmumshad (https://github.com/mmumshad/kubernetes-the-hard-way)
