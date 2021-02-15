apiVersion: v1
kind: Secret
metadata:
  name: $SECRET_NAME
  namespace: $NS
type: kubernetes.io/basic-auth
data: 
  username: VlMtZnVzZS1kZXY=
  password: ZjdaapNootmIeSZenNVeEJMeVE=
stringData: 
  hostname: $GIT_HOST
