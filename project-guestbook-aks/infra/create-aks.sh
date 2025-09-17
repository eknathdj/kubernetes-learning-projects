#!/usr/bin/env bash
set -euo pipefail

# EDIT
RG="rg-guestbook-demo"
LOCATION="centralindia"
AKS_NAME="aks-guestbook"
NODE_COUNT=2
NODE_VM_SIZE="Standard_DS2_v2"
ACR_NAME="acrguestbook3367"   # replace if different
# END EDIT

mkdir -p ~/.ssh

# use existing or create one
PUBKEY_FILE="$HOME/.ssh/aks_guestbook.pub"
if [[ ! -f "$PUBKEY_FILE" ]]; then
  echo "Generating SSH key at ~/.ssh/aks_guestbook ..."
  ssh-keygen -t ed25519 -C "aks-guestbook-key" -f "${PUBKEY_FILE%.*}" -N "" -q
fi

SSH_PUB=$(cat "$PUBKEY_FILE")
echo "Using public key: ${SSH_PUB:0:40}... (truncated)"

echo "Creating resource group if missing..."
az group create -n "$RG" -l "$LOCATION" >/dev/null

echo "Creating AKS (this may take ~10-20m)..."
set +e
az aks create \
  -g "$RG" -n "$AKS_NAME" \
  --location "$LOCATION" \
  --node-count "$NODE_COUNT" \
  --node-vm-size "$NODE_VM_SIZE" \
  --enable-managed-identity \
  --enable-addons monitoring \
  --ssh-key-value "$SSH_PUB" \
  --attach-acr "$ACR_NAME" \
  --generate-ssh-keys
RC=$?
set -e

if [[ $RC -ne 0 ]]; then
  echo "az aks create failed with exit $RC — retrying WITHOUT --attach-acr..."
  az aks create \
    -g "$RG" -n "$AKS_NAME" \
    --location "$LOCATION" \
    --node-count "$NODE_COUNT" \
    --node-vm-size "$NODE_VM_SIZE" \
    --enable-managed-identity \
    --enable-addons monitoring \
    --ssh-key-value "$SSH_PUB" \
    --generate-ssh-keys
  echo "If you need ACR attached, run: az aks update -g $RG -n $AKS_NAME --attach-acr $ACR_NAME"
fi

echo "Fetching kubeconfig..."
az aks get-credentials -g "$RG" -n "$AKS_NAME" --overwrite-existing

echo "kubectl nodes:"
kubectl get nodes || echo "kubectl not available or failed to contact cluster."
