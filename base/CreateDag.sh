#!/bin/bash

#Function 

function printMessage() 
{
	printf '%s %s\n' "$(date -u +"%Y-%m-%dT%H:%M:%S")" "$1";
}

#Input Parameters
github_url=$1

printMessage "Cloning URL $github_url "
github_manifest=$2

printMessage "Manifest file $github_manifest"

#Setting Airflow Home

if [ -z "${AIRFLOW_HOME}" ]; then 
    airflow_home='/root/airflow'
else 
    airflow_home=${AIRFLOW_HOME}
fi

printMessage "Airflow Home $airflow_home"

#Preparing Environment
currentDir=/tmp/$(date +%N)

printMessage "Current cloning directory $currentDir"

printMessage  "Creating directory $currentDir"

mkdir -p $currentDir

cd $currentDir

git clone "$github_url"

repo_name=$(basename $github_url)

repo_dir=$(echo $repo_name| cut -d'.' -f 1)
printMessage "Repository name $repo_dir"

cd $repo_dir