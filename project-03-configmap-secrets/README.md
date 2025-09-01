# Project 3: ConfigMaps & Secrets in Kubernetes

## 🎯 Objective

Learn how to manage application configuration and sensitive data in Kubernetes using ConfigMaps and Secrets, and inject them into Pods via environment variables.

## 📝 Concepts Covered

ConfigMap → Store non-sensitive configuration (e.g., environment variables).
Secret → Store sensitive data securely (e.g., passwords, tokens).
Injecting configs/secrets into a Deployment.
Verifying injected values inside running Pods.

## ⚡ Steps
1. Create ConfigMap

    Define non-sensitive application configs:
    kubectl apply -f configmap.yaml

    Example configmap.yaml:
    -----------------------
    apiVersion: v1
    kind: ConfigMap
    metadata:
    name: app-config
    data:
    APP_ENV: "production"
    APP_MODE: "cluster"

2. Create Secret

    Define sensitive values (base64 encoded):
    echo -n 'password123' | base64

    Apply:
    kubectl apply -f secret.yaml


    Example secret.yaml:
    --------------------
    apiVersion: v1
    kind: Secret
    metadata:
    name: app-secret
    type: Opaque
    data:
    DB_PASSWORD: cGFzc3dvcmQxMjM=   # base64 of "password123"

3. Deploy Application

    Reference ConfigMap and Secret in Deployment:
    kubectl apply -f app-deployment.yaml

    Example snippet:
    ----------------
    env:
    - name: APP_ENV
    valueFrom:
        configMapKeyRef:
        name: app-config
        key: APP_ENV
    - name: APP_MODE
    valueFrom:
        configMapKeyRef:
        name: app-config
        key: APP_MODE
    - name: DB_PASSWORD
    valueFrom:
        secretKeyRef:
        name: app-secret
        key: DB_PASSWORD

4. Verify Values

    Check environment variables inside a Pod:

    kubectl get pods -l app=demo-app
    kubectl exec -it <pod-name> -- env | grep APP_
    kubectl exec -it <pod-name> -- env | grep DB_PASSWORD

    Expected output:
    ----------------
    APP_ENV=production
    APP_MODE=cluster
    DB_PASSWORD=password123

5. Expose Service (Optional)

    Apply:
    kubectl apply -f app-service.yaml

✅ Expected Result

    Application Pods have environment variables injected from ConfigMap & Secret.

    No sensitive data is hardcoded in Deployment YAML.

🧹 Cleanup

    Remove all resources:

    kubectl delete -f app-deployment.yaml
    kubectl delete -f app-service.yaml
    kubectl delete -f configmap.yaml
    kubectl delete -f secret.yaml

## 🎯 Real-World Usefulness

🔑 Security → Secrets store credentials safely (encrypted at rest).

⚙️ Flexibility → Configs can be updated without rebuilding Docker images.

📦 Reusability → Same Deployment works across dev/staging/prod.

🏢 Best Practice → Every production-grade Kubernetes app uses ConfigMaps & Secrets.