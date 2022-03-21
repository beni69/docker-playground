# rust-docker

just some experiments using docker with rust

the example rust app from
[the rust website](https://www.rust-lang.org/learn/get-started) along with some
dockerfiles and scripts

## image sizes
- [Rust slim image](Dockerfile.distroless): 787M, 43.8s
- [Distroless cc image](Dockerfile.distroless): 26MB, 44.8s
- [Alpine](Dockerfile.alpine): 9.43M, 46.8s
- [Scratch](Dockerfile.scratch): 3.86M, 52.2s
