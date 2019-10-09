FROM golang:1.12.1 as builder

ENV app=fileserver
ENV project_dir /go/src/github.com/liyue201/fileserver
COPY . ${project_dir}
RUN go build -ldflags "-w -s" -o ${project_dir}/${app}  ${project_dir}/main.go

FROM centos:7
ENV app=fileserver
RUN mkdir /files
ENV project_dir /go/src/github.com/liyue201/fileserver
ENV work_dir /svr

WORKDIR ${work_dir}
COPY --from=builder ${project_dir}/${app} ${work_dir}/${app}

