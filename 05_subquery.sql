
USE crownfield_eye_hospital;

SELECT
    FirstName,
    LastName
FROM Patient
WHERE PatientID IN (
    SELECT PatientID
    FROM Appointment
    WHERE ClinicianID = (
        SELECT ClinicianID
        FROM Clinician
        WHERE ClinicianName = 'Dr Maya Shah'
    )
);
