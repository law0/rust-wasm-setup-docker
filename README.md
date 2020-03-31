# Rust wasm docker setup

Build docker image with :

```sh
docker build --tag wasm-rust-setup .
```

Run the image with :
```sh
docker run --rm -it -w $(pwd) -v $(pwd):$(pwd) -p 8080:8080  wasm-rust-setup:latest /bin/bash
```

Inside the docker with the rust-wasm-setup.sh script, create a new project with

```sh
./rust-wasm-setup.sh PROJECT_NAME
```
Inside PROJECT_NAME/www, To have the server running at localhost:8080, launch (outside docker)
(need npm install could't find why option -p 8080:8080 didn't make server available)

```sh
npm run start
```


Inside PROJECT_NAME/, to build launch (inside docker)
```
wasm-pack build
```

See [Here](https://rustwasm.github.io/docs/book/game-of-life/hello-world.html) for more info about rust and webassembly

