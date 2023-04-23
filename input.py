

def get_patient_info(doctorID: int) -> dict:
    """
    Retrieve all patient info from user
    """

    id: int = int(input("Input patient ID (number): "))
    patient_name: str = input("Input patient name (string): ")
    patient_gender: str = input("Input patient gender (string): ")
    patient_phone_num: str = input("Input patient phone number (string): ")
    patient_address: str = input("Input patient address (string): ")
    patient_diagnosis: str = input("Input patient diagnosis (string): ")
    nurse_id: int = int(input("Input nurse ID (number): "))
    room_num: int = int(input("Input room number (number): "))

    patient: dict = {
        "ID": id,
        "name": patient_name,
        "gender": patient_gender,
        "phone_num": patient_phone_num,
        "address": patient_address,
        "Diagnosis": patient_diagnosis,
        "doc_id": doctorID,
        "nurse_id": nurse_id,
        "room_num": room_num
    }

    return patient


def get_patient_id() -> int:
    """
    Retrieve patient ID from user
    """

    patientID = int(input("Please select the patient ID to be deleted from the list above (number): "))

    return patientID

def get_appointment_info(patientID) -> dict:
    """
    Retrieve all appointment info from user
    """

    id: int = int(input("Input appointment ID (number): "))
    visit_reason: str = input("Input reason of visit (string): ")
    date: str = input("Input appointment date (string): ")
    time: str = input("Input appointment time (string): ")
    doctor_id: int = int(input("Input doctor ID (number): "))

    appointment: dict = {
        "ID": id,
        "name": visit_reason,
        "gender": date,
        "phone_num": time,
        "patient_id": patientID,
        "doctor_id": doctor_id
    }

    return appointment


def get_record_id() -> int:
    """
    Retrieve record ID from user
    """

    recordID = int(input("Please select the record ID to be deleted from the list above (number): "))

    return recordID


def get_bill_info() -> dict:
    """
    Retrieve all billing info from user
    """
    
    bill_num: int = int(input("Input bill number (number): "))
    insurance_info: str = input("Input patient's insurance provider (string): ")
    payment: str = input("Input payment method (string): ")
    total_charge: int = int(input("Input total cost of patient bill (number): "))
    patient_id: int = int(input("Input ID of patient being charged (number): "))

    bill: dict = {
        "BillingNumber": bill_num,
        "insurance": insurance_info,
        "payment_info": payment,
        "charge": total_charge,
        "patient_id": patient_id,
    }

    return bill



def get_medicalRecord_info() -> dict:
    """
    Retrieve all patient info from user
    """

    id: int = int(input("Input Record ID (number): "))
    date: str = input("Input date (date MM/DD/YYYY): ")
    diagnosis: str = input("Input patient diagnosis (string): ")
    patient_id: int = int(input("Input Patient ID (int): "))
    doctor_id: int = int(input("Input Patient ID (int): "))

    patient: dict = {
        "ID": id,
        "name": patient_name,
        "gender": patient_gender,
        "phone_num": patient_phone_num,
        "address": patient_address,
        "Diagnosis": patient_diagnosis,
        "doc_id": doctorID,
        "nurse_id": nurse_id,
        "room_num": room_num
    }

    return patient
