# Project 2: Horizontal Pod Autoscaler (HPA) on Nginx Deployment

## 🎯 Objective
Extend the Nginx Deployment from Project 1 by configuring resource requests/limits and enabling Horizontal Pod Autoscaler (HPA) to automatically scale the number of Pods based on CPU utilization.

## 📝 Concepts Covered
- Resource Requests & Limits (CPU, Memory)
- Metrics Server for gathering CPU/Memory usage
- Horizontal Pod Autoscaler (HPA) configuration
- Auto-scaling Pods under load

## ⚡ Steps
1. Update Deployment with Resources

   Add CPU/Memory requests and limits in the Nginx Deployment.
   Apply it:
   kubectl apply -f nginx-deployment.yaml

2. Ensure Metrics Server is Running

   Check if metrics are available:
   kubectl top nodes

   If not installed (on Minikube):
   minikube addons enable metrics-server

3. Apply HPA

   Create the HPA object:
   kubectl apply -f nginx-hpa.yaml

   Verify HPA status:
   kubectl get hpa


   Example output:
   ---------------
   NAME        REFERENCE                     TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
   nginx-hpa   Deployment/nginx-deployment   10%/50%   2         5         2          1m

4. Generate Load

   Run a BusyBox pod to generate load on the Nginx Service:
   kubectl run -i --tty load-generator --rm --image=busybox -- /bin/sh


   Inside the pod, run:
   while true; do wget -q -O- http://nginx-service; done

5. Observe Scaling

   In a separate terminal:
   kubectl get hpa -w

   or

   kubectl get pods -w

   As CPU utilization increases, replicas will scale up (from 2 → up to 5).
   When load decreases, replicas scale back down.

✅ Expected Result

   Initial Deployment starts with 2 Pods.

   Under heavy load, Pods auto-scale up to 5 replicas.

   When load reduces, Pods shrink back to 2 replicas.

🧹 Cleanup

   To remove resources:

   kubectl delete -f nginx-hpa.yaml
   kubectl delete -f nginx-deployment.yaml
   kubectl delete -f nginx-service.yaml
