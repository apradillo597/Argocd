# Argocd
# Hello API (Minikube + Helm + GHCR + opcional Argo CD)


## 1) Preparar el repo
- Crea un repo vacío en GitHub (público o privado). Copia estos archivos.
- Si vas a usar GHCR: la primera vez, una vez que se publique la imagen, marca el paquete como **Public** (Settings → Packages → hello-api → Change visibility → Public), así minikube puede descargar sin secret.


## 2) Probar **local** con minikube (sin registro)
```bash
minikube start
# Construye la imagen dentro del daemon de minikube
eval $(minikube docker-env)
DOCKER_BUILDKIT=1 docker build -t hello-api:dev .
helm upgrade --install hello-dev ./chart \
--set image.repository=hello-api \
--set image.tag=dev \
--set env.APP_VERSION=local
kubectl get pods,svc
# Exponer y probar
minikube service $(kubectl get svc -o jsonpath='{.items[0].metadata.name}') --url
# -> visita la URL y verás {status: ok, ...}