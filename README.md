# The airbyte URL should be accessible at:

https://airbyte.fannylimin.my.id (nginx)
https://airbyte-orbit.fannylimin.my.id (emissary)

# GKE has this specification:

- 1 Control Plane with 2 Worker nodes
- Machine type: e2-standard-2 (2vCPU - 8GB RAM) per node

# Why not e2-medium (2vCPU - 4GB RAM)?
I was facing an issue with insufficient CPU & Memory with airbyte, causing some pods (airbyte, cert-manager, ingress-controller) to fail scheduling. Airbyte is known to require a minimum of 8GB RAM (https://docs.airbyte.com/enterprise-setup/implementation-guide). Even though I limited the resource requests, the nodes still need to have space for cert-manager and ingress controllers.RetryClaude does not have internet access. Links provided may not be accurate or up to date.
