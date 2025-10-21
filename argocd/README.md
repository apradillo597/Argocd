kubectl -n argocd port-forward svc/argocd-server 8080:80

admin // 1l7Tc7KQHL3Sfwhd

para vovler a sacar la pass :

 kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d; echo