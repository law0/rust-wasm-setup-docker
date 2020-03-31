if [ -z "$1" ]
then
  echo "USAGE: rust-wasm-setup.sh PROJECT_NAME"
  exit -1
fi

export USER=rust-wasm
projectname="$1"
echo "$projectname" | cargo generate --git https://github.com/rustwasm/wasm-pack-template
cd $projectname
wasm-pack build
mkdir www
npm init wasm-app www
cd www
### add dependency in www/package.json
sed -ie s/'.*devDependencies.*'/'&\n    "'$projectname'": "file:..\/pkg",'/g package.json
### Change import hello-wasm-pack to our project name
sed -i s:'"hello-wasm-pack"':'"'$projectname'"':g index.js 
npm install

echo
echo -ne <<- EOF
  ###########################################################################################
  ### To launch the server :
  ### npm run start
  ### inside $projectname/www
  ### To build
  ### wasm-pack build
  ### inside $projectname
  ###
  ##########################################################################################
EOF

