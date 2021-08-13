#!/bin/bash

declare -A dictionary


#Function 

function printMessage() 
{
	printf '%s %s\n' "$(date -u +"%Y-%m-%dT%H:%M:%S")" "$1";
}

function parseDagDefToDic()
{
	printMessage "Present Working Directory $1, Input dag definition file $2"
	gitClonedDir=$1
	inputDefinitionFile=$2
	
	completeFileNameWithDir = "$gitClonedDir/$inputDefinitionFile"
    printMessage "Complete Path for dag definition file $completeFileNameWithDir"
	
	while read line; do
    if [[ $line != #* ]]; 
    then
        key=$(echo $line | cut -d "=" -f1)
        data=$(echo $line | cut -d "=" -f2)
        dictionary[$key]="$data"
    fi
done <"$completeFileNameWithDir"	
}

function getDagDefinitionFile()
{
    echo dictionary["dagfileName"]
}

function getDagDependencies()
{
    echo dictionary["dependencies"]
}

function getRequirementsFile()
{
    echo dictionary["requirements_file"]
}


#Input Parameters
github_url=$1

printMessage "Cloning URL $github_url "
inputTemplate=$2

printMessage "Input dag definition file $inputTemplate"

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

parseDagDefToDic $PWD $inputTemplate

dagDefinitionFile=$(getDagDefinitionFile)
printMessage "Dag Definition file $dagDefinitionFile"

dependencies=$(getDagDependencies)
printMessage "Dag Dependencies file $dependencies"

requirements_file=$(getRequirementsFile)
printMessage "Requirement file $requirements_file"