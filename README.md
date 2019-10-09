# Fileserver

##  Build
```
docker build . -t fileserver
```

##  Run
```
docker run --name fileserver \
 -v $PWD/files:/files \
 -p 8080:8080 \
 fileserver /svr/fileserver 
```
