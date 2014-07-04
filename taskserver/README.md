# rampantmonkey/taskserver

Docker container for [Taskwarrior](http://taskwarrior.org/) server.

## Usage
1. Pull image from Docker Hub `docker pull rampantmonkey/taskserver`
2. Initialize data and keys `docker run -v ~/task_data:/task_data -v ~/task_keys:/task_keys rampantmonkey/taskserver /init.sh`
3. Copy user key fingerprint from output of previous command (Hint: look for a message like this `New user key: cf31f287-ee9e-43a8-843e-e8bbd5de4294`)
4. Add this key to your `.taskrc` (see: http://taskwarrior.org/docs/server_taskwarrior.html](http://taskwarrior.org/docs/server_taskwarrior.html))
5. Start task server `docker run -d -v ~/task_data:/task_data -v ~/task_keys:/task_keys rampantmonkey/taskserver`
6. Synchronize user data `task synchronize initialize`

## Initializing

Since `taskserver` requires keys to be stored securely deploying this container has one extra step.
You must run `./init.sh` before starting the server.
This script will create an empty task directory as well as SSL certificates and keys.

## Directories and Ports

`taskserver` will run on container port `53589`.
Map this wherever you wish, however `task` clients will look for `53589` by default.

Data and keys will be stored in subdirectories of `/task`.
To persist the tasks you should map `/task` to a local path or a data container.

## Customization

By default the [init script](init.sh) included with this image creates one user `First Last` belonging to the `Public` organization.
If this does not suit your use case modify `init.sh` and rebuild the image (`docker build .`).
