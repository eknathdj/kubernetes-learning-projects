## Project Bonus: WordPress + MySQL on Kubernetes

# 🎯 Objective

Deploy a real-world application — WordPress with a MySQL database — on Kubernetes.
This project introduces stateful workloads using Persistent Volumes (PVCs) and demonstrates secure configuration using Secrets.

# 📝 Concepts Covered

Deploying multi-tier applications (frontend + backend).

Managing Secrets for sensitive data (DB credentials).

Using PersistentVolumeClaim (PVC) for database storage.

Exposing applications using NodePort Service.

# ⚡ Steps
1. Create MySQL Secret

    Store DB credentials securely:
    kubectl apply -f mysql-secret.yaml


    Example:
    --------
    apiVersion: v1
    kind: Secret
    metadata:
    name: mysql-secret
    type: Opaque
    data:
    mysql-root-password: cGFzc3dvcmQ=        # "password" (base64)
    mysql-user-password: cHVibGljcGFzcw==    # "publicpass" (base64)

2. Deploy MySQL with PVC

    Apply MySQL Deployment + Service:
    kubectl apply -f mysql-deployment.yaml

    Uses a PersistentVolumeClaim to store data.
    Credentials come from Secret.

3. Deploy WordPress

    Apply WordPress Deployment + Service:
    kubectl apply -f wordpress-deployment.yaml

    Connects to MySQL using environment variables.
    Exposed via NodePort (30080) for external access.

4. Access WordPress

    If using Minikube:
    minikube service wordpress

    or open: http://<minikube-ip>:30080

    If using Docker Desktop / kind:
    Open browser → http://localhost:30080

👉 You should see the WordPress setup page 🎉

5. Cleanup

    Delete all resources:

    kubectl delete -f wordpress-deployment.yaml
    kubectl delete -f mysql-deployment.yaml
    kubectl delete -f mysql-secret.yaml

# ✅ Expected Result

MySQL runs with a PVC for persistent storage.

WordPress connects to MySQL using Secrets for credentials.

WordPress is accessible via browser and ready for setup.

# 🎯 Real-World Usefulness

🔑 Secrets: Keep DB credentials secure.

💾 PVCs: Ensure database data persists across pod restarts.

🌐 Multi-tier Deployment: Shows how frontend & backend services work together.

🏢 Production Simulation: WordPress + MySQL is a real-world stack, used in enterprises.