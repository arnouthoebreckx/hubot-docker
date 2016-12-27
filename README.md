#Hubot JARVIS

##Preparation
we'll be creating the huBot files before we link it to the container through a volume. These files are already present in this repository (jarvis)

If you want to do this yourself though I'll give you the stepes
###Installation & Creation huBot
We'll do this on machine that has [npm and nodejs](https://nodejs.org/en/download/) installed.

1. Use `npm install -g yo generator-hub` to install the hubot generator for Yeoman.

2. You can `mkdir [hubotname] && cd [hubotname]` and now we can create or bot inside using 'yo hubot --adapter=slack'

##Dockerfile
After you cloned the repository to your docker server we'll be building the docker image`docker build -t [id]\hubot .`

1. run the docker container `docker run -d --env-file env.list -v ~/hubot-jarvis/jarvis:/opt/botdir tourna/hubot`

2. It's entirely possible that you have the `chmod u+x ~/hubot-jarvis/jarvis/bin/hubot`, you might have to do this for your node_modules map aswell

##Installing new modules
Now this is a bit tricky since we're running the hubot command to start the container if we stop it the container will die. Meaning that we can't use shell commands anymore.
Well the solution, I pull this repo to my local machine and use the npm install <PLUGINHERE> there then push it and restart the container.
Don't forget to add it in your `external-scripts.json` file.