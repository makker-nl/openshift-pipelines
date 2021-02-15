apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: $PVC_SRC
spec:
  accessModes:
    - ReadWriteOnce
  volumeMode: Filesystem
  resources:
    requests:
      storage: 1Gi
