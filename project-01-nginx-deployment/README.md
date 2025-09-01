# Project 1: Nginx Deployment on Kubernetes

## 🎯 Objective
Deploy a simple Nginx application on Kubernetes, expose it using a Service, and scale the replicas.

## 📝 Concepts Covered
- Deployment (Pods, Replica management)
- Service (ClusterIP)
- Scaling Deployments

## ⚡ Steps
1. Apply Deployment

   kubectl apply -f nginx-deployment.yaml

2. Apply Service

   kubectl apply -f nginx-service.yaml

3. Port-forward to access Nginx locally

   kubectl port-forward svc/nginx-service 8080:80
   Open → http://localhost:8080

4. Scale replicas

   kubectl scale deployment nginx-deployment --replicas=5

✅ Expected Result
Nginx default page loads in browser.

5. replicas visible via kubectl get pods.

6. 🧹 Cleanup
   kubectl delete -f nginx-deployment.yaml
   kubectl delete -f nginx-service.yaml
