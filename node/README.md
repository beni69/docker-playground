# node-docker

an example hello world express server in javascript

## image sizes

-   [Regular node image](Dockerfile.node): 910MB, 18.4s
-   [Alpine node image](Dockerfile.alpine): 115MB, 5.8s
-   [Distroless node image](Dockerfile.distroless): 119MB, 21.2s

## conclusion

for a simple hello-world web server there aren't any special things needed so
the only real difference between the images is the bundle size. if more specific
things are needed, maybe debian has an advantage, but right here it's a close
tie with alpine in terms of image size, but alpine wins for ease of use and not
needing a seperate builder image.

maybe some performance benchmarks would be useful...
