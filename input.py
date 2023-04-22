

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
    nurse_id: int = int(input("Input nurse ID (int): "))
    room_num: int = int(input("Input room number (int): "))

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