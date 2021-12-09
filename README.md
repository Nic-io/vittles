# Vittles

Supply airdrop for dev. Operation-Vittles

Contains docker and config files for various dev enviroments.

# Usage 

## Setting up vim
```
./drop.sh vim 
```
Sets up vimrc file and vim plugins on your local machine.

## Build a container for Zephyr application development
```
./drop.sh zephyr_cntr
```
This builds an image based on ubuntu with the Zephyr SDK and sources. 

This being no lightweight image it is better run with VScode. 
For quick setup simply 
```cp misc/devcontainer.json 'YOUR_PROJECT_PATH'/.devcontainer/devcontainer.json``` 

## Build a container for bare metal C dev
```
./drop.sh bare-metal-c
```
## Build a container for tftpboot & nfs
```
./drop.sh nfs_srv
```
can then be run with 

```
 docker run -v "ROOTFS_FOLDER":/srv/bbonefs -v "BOOT_FOLDER":/srv/boot/ --privileged -ti vittles-bbb:latest
```
Where ROOTFS_FOLDER is the targets rootfs on your host machine and 
BOOT_FOLDER is where the dtb and compile kernel are on your host

Run the startup.sh script within the container to spin up the services

You'll also need to add  whatever interface your taget is connected to to the docker0 bridge

ie. ``` sudo brctl addif docker0 enx001 ```

