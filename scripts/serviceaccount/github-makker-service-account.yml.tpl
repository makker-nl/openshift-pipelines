kind: ServiceAccount
apiVersion: v1
metadata:
  name: $SERVICE_ACCOUNT
  namespace: $NS
secrets:
  - name: $SECRET_NAME
