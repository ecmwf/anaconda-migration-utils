# Anaconda Migration Utils

This repository contains helper scripts to migrate from Anaconda-based installations and environments subject to [Anaconda's Terms of Service](https://legal.anaconda.com/policies/en/#terms-of-service) to conda-forge based ones.

## `conda_licensed_envs`
This command-line tool shows any environments, including the base ones in any conda installation, that may be using any packages from Anaconda subject to its Terms of Service. By default, with no arguments, it will check those environments from the current user. It is also possible to pass a username as an argument to check that user's compliance.

`conda_licensed_envs` works on any UNIX-based environment, such as Linux, MacOS or Windows Subsystem for Linux (WSL). If running on Windows, use the powershell version `conda_licensed_envs`

## `conda_exporter`
This command-line can help you export an existing environment using default Anaconda channels into one without it, using conda-forge as replacement. It will export the environment from history, but preserving the same package versions installed including those installed through pip.

`conda_exporter` works on any platform with Python 3.6 or above, with the pyyaml extra package installed.
