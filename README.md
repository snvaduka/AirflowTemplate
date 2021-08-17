# AirflowTemplate
The Following are the steps required to perform orchestration of dag using airflow webui

1. Fork the github [https://github.com/snvaduka/AirflowTemplate.git] to the other repository
2. After forking the github, you will find the below directory structure
    * [Project]
        * base  <--- Framework code just ignore 
        * dags
            * SimpleDagTemplate.py
            * MediumDagTemplate.py
            * ComplexDagTemplate.py   
        * conf
            * Dependency.conf
            * Dependency.properties
        * scripts
            * UpdateDag.sh
            * CreateDag.sh
            * Template.sh <---- Sample Template as reference
        * requirements
            * Template_requirements.txt <---- Dag dependency requirements   
        * Template.amt <----- Manifest file ***
        
# Follow the below process to create or update a dag
## Create Dag
1. Copy any dag python file under dags based on the requirement, modify the changes in the python file.
2. Add a unique name for dag_id as ###### <PROJECT_NAME>_TASK_DETAIL ###### 
