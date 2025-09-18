# Pilot Migration Quick Runbook (one page)
1. Assess application dependencies and choose pilot candidate.
2. Containerize app and push to registry.
3. Provision infra with Terraform (plan & review).
4. Deploy Helm chart to cluster and validate.
5. Run smoke tests & record results.
6. If issues, inspect logs (`kubectl describe`, `kubectl logs`), fix, and redeploy.
7. Rollback if critical, or proceed with staged migration.
