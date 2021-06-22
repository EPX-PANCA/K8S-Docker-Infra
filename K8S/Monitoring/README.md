## Monitoring Prometheus & Grafana (Helm)


```sh
1. helm repo add bitnami https://charts.bitnami.com/bitnami
2. helm repo update
3. helm install prometheus bitnami/kube-prometheus  [ test prometheus dengan port forward -> kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090 ]
4. helm install grafana bitnami/grafana [ cek grafana -> kubectl port-forward svc/grafana 3000 ]
5. akses prometheus di grafana -> http://prometheus-kube-prometheus-prometheus.default.svc.cluster.local:9090
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