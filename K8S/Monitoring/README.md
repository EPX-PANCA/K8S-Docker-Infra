## Monitoring Prometheus & Grafana (Helm)


```sh
1. helm repo add bitnami https://charts.bitnami.com/bitnami
2. helm repo update
3. helm install prometheus bitnami/kube-prometheus  [ test prometheus dengan port forward -> kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090 ]
4. helm install grafana bitnami/grafana [ cek grafana -> kubectl port-forward svc/grafana 3000 ]
5. Get Password Grafana -> echo "$(kubectl get secret grafana-admin --namespace default -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 --decode)"
6. akses prometheus di grafana -> http://prometheus-kube-prometheus-prometheus.default.svc.cluster.local:9090
```

```sh
#Ekspose grafana dengan loadbalancer
apiVersion: v1
kind: Service
metadata:
  name: grafana-service
spec:
  type: LoadBalancer
  selector:
    name: grafana
  ports:
    - port: 80
      targetPort: 3000
```

```sh
#Ekspose grafana dengan nodePort
apiVersion: v1
kind: Service
metadata:
  name: grafana-service
spec:
  type: NodePort
  selector:
    name: grafana
  ports:
    - port: 80
      targetPort: 3000
      nodePort: 30100
```

http://blog.marcnuri.com/prometheus-grafana-setup-minikube/

https://blog.marcnuri.com/yakc-kubernetes-dashboard/

https://betterprogramming.pub/monitor-your-kubernetes-cluster-with-prometheus-and-grafana-1f7d0195e59

1860
8685
4151



================================================= V2 =================================================

#### create Minikube cluster
    minikube start --cpus 4 --memory 8192 --vm-driver hyperkit

#### install Prometheus-operator
###### add repos
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    helm repo add stable https://kubernetes-charts.storage.googleapis.com/
    helm repo update

###### install chart
    helm install prometheus prometheus-community/kube-prometheus-stack

###### install chart with fixed version    
    helm install prometheus prometheus-community/kube-prometheus-stack --version "9.4.1"

###### Link to chart
[https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack]
