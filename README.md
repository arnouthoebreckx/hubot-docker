# Hubot JARVIS

## Disclaimer
This has absolutely nothing to do with other personal assistent projects called jarvis, I just liked the name Jarvis for a bot.

## What is Hubot Jarvis?
Jarvis is a slack hubot in a container, for more information about hubot go [here](hubot.github.com)
This was created for a project involving Jenkins and Slack, feel free to modify whatever you want but **this won't be updated anymore.**

## Preparation
we'll be creating the huBot files before we link it to the container through a volume, personally I prefer this over copying the files inside the container. 
Since if you want to edit scripts this will be faster than rebuilding. 
These files are already present in this repository (jarvis)


### Installation & Creation huBot
Let's say you want to create your own hubot first and not use Jarvis that is present in the repo.
You have to do this on a machine that has [npm and nodejs](https://nodejs.org/en/download/) installed.

1. Use `npm install -g yo generator-hub` to install the hubot generator for Yeoman.

2. You can `mkdir [hubotname] && cd [hubotname]` and now we can create or bot inside using 'yo hubot --adapter=slack'

3. You can use different adapters like discord, again refer to the documentation for this.

## Dockerfile
After you cloned the repository to your docker server we'll be building the docker image`docker build -t [id]\hubot .` 
Or you can just **pull the image from my dockerhub "tourna/hubot"**

1. run the docker container `docker run -d -p 8080:8080 --env-file env.list -v ~/hubot-jarvis/jarvis:/opt/botdir tourna/hubot`. If you want the correct date and time inside the container add the flag `-v /etc/localtime:/etc/localtime:ro`

2. It's entirely possible that you have to `chmod u+x ~/hubot-jarvis/jarvis/bin/hubot`, you might have to do this for your **node_modules map** aswell



## Installing new modules
Now this is a bit tricky since we're running the hubot command to start the container if we stop it the container will die. Meaning that we can't use shell commands anymore.
Well the solution, I pull this repo to my local machine and use the npm install <PLUGINHERE> there then push it and restart the container.
Don't forget to add it in your `external-scripts.json` file.

Go the folder of your hubot in this case jarvis, run `npm install <scriptname>`, afterwards add the module name to the external-scripts file. Like the jenkins plugin is present.
Afterwards you restart the container and the new plugin should be available.

## env.list
Use the env.list file to add the environment variables required inside the container so that hubot can connect and use all your required scripts.
