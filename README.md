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
2. Add a unique name for dag_id as **<PROJECT_NAME>_<TASK_DETAIL>** in the python file
#### Creating New Dag in Airflow ####
1. Go to Airflow URL: http://10.185.38.49:8080/home
2. Search for the Dag **mck_fw_create_dag**
![MCK_FW_Create_Dag](https://user-images.githubusercontent.com/88087256/129687718-8dea1cfa-b9e9-45df-8e76-b087b43ae0a7.jpg)
3. Run the Dag with Config
![MCK_FW_Create_Dag_With_Config](https://user-images.githubusercontent.com/88087256/129687938-e4ab451a-1bf5-4f12-8807-29bd1429411e.jpg)
4. In the config mention below input parameters and click on Trigger 
   ```
   { 
      "github_url": "*** Your Github Location ***", 
      "manifest": " *** Your Manifest Information ***" 
    }
   ```
   Sample Reference attachement: [CreateOrUpdateDag.txt](https://github.com/snvaduka/AirflowTemplate/files/6998132/CreateOrUpdateDag.txt)
   
   ![MCK_FW_Create_Dag_Input_config](https://user-images.githubusercontent.com/88087256/129689089-cbb7f33d-4098-440f-8c6f-495be4cc73d7.jpg)

5. The Airflow Dag will appear in the WebUI Console after 5 minutes
