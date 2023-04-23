"""
Additional Features:
Edit functions for doctor for patient
An Admin who does not have attributes, but will simply be able to view statistical analysis
A statistical analysis page that will be open to the public with aggregate functions and set functions
Patient can pay bill
Make sure dictors can only view their patients

"""

import os
from dotenv import load_dotenv
load_dotenv()

#-------------------------------------------------------------------------SQL Functions-------------------------------------------------------------------------------------------------------------

from input import get_patient_info, get_patient_id, get_appointment_info, get_record_id, get_bill_info, get_medicalRecord_info

import mysql.connector
from mysql.connector import Error

db_user: str | None = os.getenv("USER")
db_password: str | None = os.getenv("PASSWORD")

if not db_user or not db_password:
    print("Create a .env file and set USER and PASSWORD environment variables!")
    exit(0)

cnx = mysql.connector.connect(user=db_user, password=db_password,
                              host='127.0.0.1',
                              database='hospitalDatabase')

#-------------------------------------------------------------------------Doctor Functions-------------------------------------------------------------------------------------------------------------

#1
def doctorviewPatients(doctorID):
    try:
        cursor = cnx.cursor()
        query = ("SELECT * FROM Patient WHERE DoctorID = "+str(doctorID))
        cursor.execute(query)
        print("Here is a list of your patients:")
        for x in cursor:
            print(x)
    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))




#2
def doctorAddPatient(doctorID):
    cursor = cnx.cursor()

    patient: dict | None = None
    while not patient:
        try:
            patient = get_patient_info(doctorID)
        except ValueError:
            print("Different type entered than requested, try again.")
        
    query = "INSERT INTO patient VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"

    cursor.execute(query, tuple(patient.values()))
    cnx.commit()
    cursor.close()

    


#3 
def doctorUpdatePatient(doctorID):
    try:
        patientID = input("Please enter the patientID you would like to select:")
        cursor = cnx.cursor()
        query = ("SELECT * FROM Patient WHERE PatientID = "+str(patientID))
        cursor.execute(query)
        print("Patient located.")
        for x in cursor:
            print(x)
        lstResponses = ["PatientName", "Gender", "PhoneNumber", "Address", "Diagnosis", "RoomNumber"]
        userSelection = 0
        print("Would you like to update PatientName(1), Gender(2), PhoneNumber(3), Address(4), Diagnosis(5), or RoomNumber(6).")
        try:
            userSelection = int(input("Please make your selection here: "))
        except ValueError:
            userSelection = 0
        
        while(not(userSelection>0 and userSelection<7) ):
            print()
            print("Unfortunately, your selection choice is invalid, please try once again")
            print("Would you like to update PatientName(1), Gender(2), PhoneNumber(3), Address(4), Diagnosis(5), or RoomNumber(6).")
            try:
              userSelection = int(input("Please make your selection here: "))
            except ValueError:
                userSelection = 0
        selection = lstResponses[userSelection-1]
        print("You have selected to update: "+selection)
        updateValue = input("Please input the information that you would like to update "+selection+" to: ")
        query3 = ("UPDATE Patient SET "+selection+" = '"+updateValue+"' WHERE PatientID = "+str(patientID))
        cursor.execute(query3)
        cnx.commit()

    except mysql.connector.Error as err:
         print("Something went wrong your input value is not correct: {}".format(err))

#4
def doctorDeletePatient(doctorID):

    cursor = cnx.cursor()
    cursor.execute("SELECT * FROM Patient WHERE DoctorID = %s;", (doctorID,))

    for patient in cursor:
        patient_id, patient_name = patient[0], patient[1]
        print(f"ID #{patient_id}: {patient_name}")

    patientID: int | None = None
    while not patientID:
        try:
            patientID = get_patient_id()
        except ValueError:
            print("Different type entered than requested, try again.")

    cursor.execute("SELECT * FROM PATIENT WHERE PatientID = %s", (patientID,))

    patient_str: str = ""
    # should only be one patient with matching ID at most
    for patient in cursor:
        patient_str += f"ID #{patient[0]}: {patient[1]}"

    if not patient_str:
        print(f"No patient records match ID #{patientID}.\n")
        return


    sure = input("\nAre you sure you want to delete this patient's records? (Y/N): ")

    if sure.lower() == "y":
        cursor.execute("DELETE FROM Patient WHERE PatientID = %s;", (patientID,))
        cnx.commit()
        cursor.close()

        print("Successfully deleted patient record.")

        
#5        
def doctorViewAppointments(doctorID):
    try:
        cursor = cnx.cursor()
        query = ("SELECT * FROM Appointment WHERE doctorID = "+str(doctorID))
        print("AppointmentID,ReasonOfVisit,Date,Time,PatientID,DoctorID")
        cursor.execute(query)
        for x in cursor:
            print(x)

    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))

    
    

#6
def doctorDeleteMedicalRecord(doctorID):
    cursor = cnx.cursor()
    cursor.execute("SELECT RecordID, PatientName, Diagnosis, Treatment, DoctorID FROM medicalrecords NATURAL JOIN patient WHERE DoctorID = %s;", (doctorID,))

    records_str: str = ""
    for record in cursor:
        record_id, patient_name = record[0], record[1]
        diagnosis, treatment = record[2], record[3]
        records_str += f"ID #{record_id}: {patient_name}. Diagnosis: {diagnosis}, Treatment: {treatment}"

    if not records_str:
        print("You currently have no patients with stored medical records.")
        return
    
    print(records_str)

    RecordID: int | None = None
    while not RecordID:
        try:
            RecordID = get_record_id()
        except ValueError:
            print("Different type entered than requested, try again.")

    # cursor.execute("SELECT * FROM medicalrecords WHERE RecordID = %s", (RecordID,))
    cursor.execute("SELECT RecordID, PatientName, Diagnosis, Treatment FROM medicalrecords NATURAL JOIN patient WHERE RecordID = %s;", (RecordID,))

    record_str: str = ""
    # should only be one record with matching ID at most
    for record in cursor:
        record_id, patient_name = record[0], record[1]
        diagnosis, treatment = record[2], record[3]
        record_str += f"ID #{record_id}: {patient_name}. Diagnosis: {diagnosis}, Treatment: {treatment}"

    if not record_str:
        print(f"No medical records match ID #{RecordID}.\n")
        return


    sure = input("\nAre you sure you want to delete this medical record? (Y/N): ")

    if sure.lower() == "y":
        cursor.execute("DELETE FROM medicalrecords WHERE RecordID = %s;", (RecordID,))
        cnx.commit()
        cursor.close()

        print("Successfully deleted medical record.")


#7       
def doctorViewEquipment(staffID):
    try:
        cursor = cnx.cursor()
        query = ("SELECT * FROM MedicalEquipment WHERE staffID = "+str(staffID))
        print("EquipmentID,Type,StaffID")
        cursor.execute(query)
        for x in cursor:
            print(x)
    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))
        
        
#8
def doctorRankBills(doctorID):
    """
    Show the user a list of bill costs.
    """

    cursor = cnx.cursor()
    query: str = """SELECT PatientName, TotalCharge, RANK() OVER (ORDER BY TotalCharge DESC)
    FROM patient NATURAL JOIN billing"""

    cursor.execute(query)

    for bill in cursor:
        name, charge, rank = bill
        print(f"{rank}) {name}: ${charge}")

#9
def doctorHospitalStats(doctorID):
    """
    Show a list of hospital stats
    """

    tables: list[str] = ["doctor", "nurse", "patient"]

    cursor = cnx.cursor()

    for table in tables:
        query: str = f"SELECT COUNT(*) FROM {table};"
        cursor.execute(query)

        count = 0
        for num in cursor:
            count = int(num[0])
            
        print(f"{table.title()}: {count} entries")

#10
def doctorDiseasePercentages(doctorID):
    """
    View the percentage of patients with each disease
    """

    cursor = cnx.cursor()

    query: str = """SELECT Diagnosis, 
    COUNT(Diagnosis)*100 / (SELECT COUNT(*) FROM medicalrecords) AS percent
    FROM medicalrecords 
    GROUP BY Diagnosis
    ORDER BY percent DESC;
    """

    cursor.execute(query)

    diagnosis_str: str = ""
    for diagnosis in cursor:
        diagnosis_str += f"{diagnosis[0]}: {int(diagnosis[1])}%\n"

    if diagnosis_str:
        print(diagnosis_str)

    else:
        print("No medical records to display!")


#-------------------------------------------------------------------------Doctor Functions-------------------------------------------------------------------------------------------------------------





#-------------------------------------------------------------------------Nurse Functions-------------------------------------------------------------------------------------------------------------


#1    
def nurseAddMedicalRecord(nurseID):
    cursor = cnx.cursor()
    MedicalRecord: dict | None = None
    while not MedicalRecord:
        try:
            MedicalRecord = get_medicalRecord_info()
        except ValueError:
            print("Different type entered than requested, try again.")
        
    query = "INSERT INTO MedicalRecords VALUES (%s, %s, %s, %s, %s, %s)"

    cursor.execute(query, tuple(MedicalRecord.values()))
    cnx.commit()
    cursor.close()

#2
def nurseAddBilling(nurseID):
    cursor = cnx.cursor()

    bill: dict | None = None
    while not bill:
        try:
            bill = get_bill_info()
        except ValueError:
            print("Different type entered than requested, try again.")
        
    query = "INSERT INTO billing VALUES (%s, %s, %s, %s, %s)"

    cursor.execute(query, tuple(bill.values()))
    cnx.commit()
    cursor.close()

#3
def nurseViewEquipment(staffID):
    try:
        cursor = cnx.cursor()
        query = ("SELECT * FROM MedicalEquipment WHERE staffID = "+str(staffID))
        print("EquipmentID,Type,StaffID")
        cursor.execute(query)
        for x in cursor:
            print(x)
    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))


#-------------------------------------------------------------------------Nurse Functions-------------------------------------------------------------------------------------------------------------




#-------------------------------------------------------------------------Patient Functions-------------------------------------------------------------------------------------------------------------
#1
def patientCreateAppointments(patientID):
    cursor = cnx.cursor()

    appt: dict | None = None
    while not appt:
        try:
            appt = get_appointment_info(patientID)
        except ValueError:
            print("Different type entered than requested, try again.")
        
    query = "INSERT INTO appointment VALUES (%s, %s, %s, %s, %s, %s)"

    cursor.execute(query, tuple(appt.values()))
    cnx.commit()
    cursor.close()



#2
def patientViewAppointments(patientID):
    try:
        cursor = cnx.cursor()
        query = ("SELECT * FROM Appointment WHERE PatientID = "+str(patientID))
        print("AppointmentID,ReasonOfVisit,Date,Time,PatientID,DoctorID")
        cursor.execute(query)
        for x in cursor:
            print(x)
    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))



#3
def patientViewRecords(patientID):
    try:
        cursor = cnx.cursor()
        query = ("SELECT * FROM MedicalRecords WHERE PatientID = "+str(patientID))
        print("RecordID,Date,Diagnosis,Treatment,PatientID,DoctorID")
        cursor.execute(query)
        for x in cursor:
            print(x)
    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))

#4
def patientViewVisitors(patientID):
    try:
        cursor = cnx.cursor()
        query = ("SELECT * FROM Visitors WHERE PatientID = "+str(patientID))
        print("VisitorID,Date,RelationshipToPatient,PatientID")
        cursor.execute(query)
        for x in cursor:
            print(x)
    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))

#5
def patientViewBilling(patientID):
    try:
        cursor = cnx.cursor()
        query = ("SELECT * FROM Billing WHERE PatientID = "+str(patientID))
        print("BillNumber,InsuranceInfo,Payment,TotalCharge,PatientID")
        cursor.execute(query)
        for x in cursor:
            print(x)
    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))
    
    
    
#6
def patientViewRoom(patientID):
    try:
        cursor = cnx.cursor()
        query = ("SELECT RoomNumber FROM Patient WHERE PatientID = "+str(patientID))
        cursor.execute(query)
        roomnum = 0
        for x in cursor:
            roomnum = x[0]
        print("Room Number: ",roomnum)
        print("RoomNumber,RoomType,HospitalSection")
        query2 = ("SELECT * FROM Room WHERE RoomNumber = "+str(roomnum))
        cursor.execute(query2)
        for x in cursor:
            roomnum = x[0]
            print(x)
    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))
#-------------------------------------------------------------------------Patient Functions-------------------------------------------------------------------------------------------------------------







#-------------------------------------------------------------------------Doctor,Patient,Nurse Functions-------------------------------------------------------------------------------------------------------------
def doctor():


    
    try:
        cursor = cnx.cursor()
        inputDoctorName = input("Please enter your doctor ID or 'M' if you would like to return to the main menu: ")
        if(str(inputDoctorName)=='M'):
            main()
        query = ("SELECT DoctorID FROM Doctor")
        cursor.execute(query)
        for x in cursor:
            if(str(x[0])==str(inputDoctorName)):
                print("The Doctor ID Specified has been located in the database.")
        query2 = ("SELECT StaffID FROM Doctor WHERE DoctorID = "+inputDoctorName)
        cursor.execute(query2)
        staffID = ''
        for x in cursor:
            staffID = x[0]
            print("Your Staff ID is "+str(x[0]))
        query3 = query2 = ("SELECT StaffName FROM Staff WHERE StaffID = "+str(staffID))
        cursor.execute(query3)
        for x in cursor:
            print("Welcome Dr. "+ str(x[0]))
        doctorID = inputDoctorName
        doctorLoggedIn(doctorID,staffID)
    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))
        doctor()




        
    


def doctorLoggedIn(doctorID,staffID):
    print("Please select one of the following options and enter the corresponding number.")
    print("Would you like to:")
    print("1. View list of Patients you are assigneed to.")
    print("2. Add a new Patient with a Nurse to your assignment.")
    print("3. Update an existing Patient of yours from the Hospital Database.")
    print("4. Delete an existing Patient of yours.")
    print("5. View your Appointments with Patients.")
    print("6. View Equipment you are currently using.")
    print("7. Delete a Medical Record of an existing Patient.")
    print("8. View all active bills by cost.")
    print("9. View total number of doctors, nurses and patients at hospital.")
    print("10. View percentage of patients with each diagnosis from medical records.")
    try:
      doctorSelection = int(input("Please make your selection here: "))
    except ValueError:
        doctorSelection = 0
    while(not(doctorSelection>0 and doctorSelection<11) ):
        print()
        print("Unfortunately, your selection choice is invalid, please try once again")
        print("Please select one of the following options and enter the corresponding number.")
        print("Would you like to:")
        print("Would you like to:")
        print("1. View list of Patients you are assigneed to.")
        print("2. Add a new Patient with a Nurse to your assignment.")
        print("3. Update an existing Patient of yours from the Hospital Database.")
        print("4. Delete an existing Patient of yours.")
        print("5. View your Appointments with Patients.")
        print("6. View Equipment you are currently using.")
        print("7. Delete a Medical Record of an existing Patient.")
        print("8. View all active bills by cost.")
        print("9. View total number of doctors, nurses and patients at hospital.")
        print("10. View percentage of patients with each diagnosis from medical records.")
        try:
          doctorSelection = int(input("Please make your selection here: "))
        except ValueError:
            doctorSelection = 0

    if(doctorSelection==1):
        doctorviewPatients(doctorID)

    elif doctorSelection == 2:
        doctorAddPatient(doctorID)
        
    elif doctorSelection == 3:
        doctorUpdatePatient(doctorID)
        
    elif doctorSelection == 4:
        doctorDeletePatient(doctorID)
        
        
    elif doctorSelection == 5:
        doctorViewAppointments(doctorID)
        
    elif doctorSelection == 6:
        doctorDeleteMedicalRecord(doctorID)
        
        
    elif doctorSelection == 7:
        doctorViewEquipment(staffID)
     
    elif doctorSelection == 8:
        doctorRankBills(doctorID)
        
        
    elif doctorSelection == 9:
        doctorHospitalStats(doctorID)
        
        
    elif doctorSelection == 10:
        doctorDiseasePercentages(doctorID)

    

    logOff = input("Would you like to logoff (Y/N): ")
    while(logOff!='Y' and logOff!='N'):
        print("Unfortunately, your selection choice is invalid, please try once again")
        logOff = input("Would you like to logoff (Y/N): ")
    if(logOff=='Y'):
        print("Thank you for logging on.")
    elif(logOff=='N'):
        doctorLoggedIn(doctorID,staffID)
        
        



def nurse():
    try:
        cursor = cnx.cursor()
        nurseIDTemp = input("Please enter your Nurse ID or 'M' if you would like to return to the main menu: ")
        if(str(nurseIDTemp)=='M'):
            main()
        query = ("SELECT NurseID FROM Nurse")
        cursor.execute(query)
        for x in cursor:
            if(str(x[0])==str(nurseIDTemp)):
                print("The Nurse ID Specified has been located in the database.")
        query2 = ("SELECT StaffID FROM Nurse WHERE NurseID = "+nurseIDTemp)
        cursor.execute(query2)
        staffID = ''
        for x in cursor:
            staffID = x[0]
            print("Your Staff ID is "+str(x[0]))
        query3 = query2 = ("SELECT StaffName FROM Staff WHERE StaffID = "+str(staffID))
        cursor.execute(query3)
        for x in cursor:
            print("Welcome Nurse "+ str(x[0]))
        nurseID = nurseIDTemp
        nurseLoggedIn(nurseID,staffID)
    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))
        nurse()

   


def nurseLoggedIn(nurseID,staffID):
    print("Please select one of the following options and enter the corresponding number.")
    print("Would you like to:")
    print("1. Add a Medical Records to a Patient assigned to you.")
    print("2. Add Billing Information to a Patient assigned to you.")
    print("3. View Equipment you are currently using.")



    try:
      nurseSelection = int(input("Please make your selection here: "))
    except ValueError:
        nurseSelection = 0
    
    while(not(nurseSelection>0 and nurseSelection<4) ):
        print()
        print("Unfortunately, your selection choice is invalid, please try once again")
        print("Please select one of the following options and enter the corresponding number.")
        print("Would you like to:")
        print("1. Add a Medical Records to a Patient assigned to you.")
        print("2. Add Billing Information to a Patient assigned to you.")
        print("3. View Equipment you are currently using.")

        try:
          nurseSelection = int(input("Please make your selection here: "))
        except ValueError:
            nurseSelection = 0


    if nurseSelection == 1:
        nurseAddMedicalRecord(nurseID)

    elif nurseSelection == 2:
        nurseAddBilling(nurseID,staffID)
    
    elif nurseSelection == 3:
        nurseViewEquipment(staffID)
            
    logOff = input("Would you like to logoff (Y/N): ")
    while(logOff!='Y' and logOff!='N'):
        print("Unfortunately, your selection choice is invalid, please try once again")
        logOff = input("Would you like to logoff (Y/N): ")
    if(logOff=='Y'):
        print("Thank you for logging on.")
    elif(logOff=='N'):
        nurseLoggedIn(nurseID,staffID)


def patient():
    try:
        cursor = cnx.cursor()
        patientIDTemp = input("Please enter your Patient ID or 'M' if you would like to return to the main menu: ")
        if(str(patientIDTemp)=='M'):
            main()
        query = ("SELECT PatientID FROM Patient")
        cursor.execute(query)
        found = False
        for x in cursor:
            if(str(x[0])==str(patientIDTemp)):
                print("The Patient ID Specified has been located in the database.")
                found = True
        if(not found):
            print("The patientID has not been found in the database.")
            patient()
        query3 = ("SELECT PatientName FROM Patient WHERE PatientID = "+str(patientIDTemp))
        cursor.execute(query3)
        for x in cursor:
            print("Welcome Patient "+ str(x[0]))
        patientID = patientIDTemp
        patientLoggedIn(patientID)
    except mysql.connector.Error as err:
        print("Something went wrong your input value is not correct: {}".format(err))


def patientLoggedIn(patientID):
    print("Please select one of the following options and enter the corresponding number.")
    print("Would you like to:")
    print("1. Create an Appointment with a Doctor.")
    print("2. View a list of your Appointments.")
    print("3. View Medical Records.")
    print("4. View a list of your Visitors.")
    print("5. View your Billing information.")
    print("6. View your Room Number.")
    try:
      patientSelection = int(input("Please make your selection here: "))
    except ValueError:
        patientSelection = 0
    
    while(not(patientSelection>0 and patientSelection<7) ):
        print()
        print("Unfortunately, your selection choice is invalid, please try once again")
        print("Please select one of the following options and enter the corresponding number.")
        print("Would you like to:")
        print("1. Create an Appointment with a Doctor.")
        print("2. View a list of your Appointments.")
        print("3. View Medical Records.")
        print("4. View a list of your Visitors.")
        print("5. View your Billing information.")
        print("6. View your Room Number.")
        try:
          patientSelection = int(input("Please make your selection here: "))
        except ValueError:
            patientSelection = 0

    if patientSelection == 1:
        patientCreateAppointments(patientID)

    elif patientSelection == 2:
        patientViewAppointments(patientID)
   
    elif patientSelection == 3:
        patientViewRecords(patientID)
    
    elif patientSelection == 4:
        patientViewVisitors(patientID)
        
    elif patientSelection == 5:
        patientViewBilling(patientID)
    
    elif patientSelection == 6:
        patientViewRoom(patientID)

    # patientViewAppointments(patientID)
    logOff = input("Would you like to logoff (Y/N): ")
    while(logOff!='Y' and logOff!='N'):
        print("Unfortunately, your selection choice is invalid, please try once again")
        logOff = input("Would you like to logoff (Y/N): ")
    if(logOff=='Y'):
        print("Thank you for logging on.")
    elif(logOff=='N'):
        patientLoggedIn(patientID)

#-------------------------------------------------------------------------Doctor,Patient,Nurse Functions-------------------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------Main Method-----------------------------------------------------------------------------------------------------








            
def main():
    loggedInAs = None
    print("Welcome to the hospital system!")
    print("If you are a Doctor please enter 'D'.\nIf you are a Nurse please enter 'N'.\nIf you are a Patient please enter 'P'.")
    userSelection = input("Please make your selection here: ")
    while(userSelection!= 'D' and userSelection!= 'N' and userSelection!= 'P'):
        print()
        print("Unfortunately, your selection choice is invalid, please try once again")
        print("If you are a Doctor please enter 'D'.\nIf you are a Nurse please enter 'N'.\nIf you are a Patient please enter 'P'.")
        userSelection = input("Please make your selection here: ")
    if(userSelection== 'D'):
        doctor()
    elif(userSelection== 'N'):
        nurse()
    elif(userSelection== 'P'):
        patient()
main()










#---------------------------------------------------------------------------------Main Method-----------------------------------------------------------------------------------------------------
