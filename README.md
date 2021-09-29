# Vittles

Supply airdrop for dev. Operation-Vittles

## Usage 

#### Setting up vim
```
./drop.sh vim 
```
Sets up vimrc file and vim plugins

#### Build a container for bare metal C dev
```
./drop.sh bare-metal-c
```
#### Build a container for tftpboot & nfs
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

