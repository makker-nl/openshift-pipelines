apiVersion: v1
kind: Secret
metadata:
  name: $SECRET_NAME
  namespace: $NS
type: kubernetes.io/basic-auth
data: 
  username: VlMtZnVzZS1kZXY=
  password: MGYwM2VmMTE2Y2VhMTNlMjFlZDk2MWY3MjQ0MmViMmIyN2M5YjM0ZQ==
stringData: 
  hostname: $GIT_HOST
