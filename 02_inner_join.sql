
USE crownfield_eye_hospital;

SELECT
    a.AppointmentID,
    p.FirstName,
    p.LastName,
    c.ClinicianName,
    a.AppointmentDate
FROM Appointment a
INNER JOIN Patient p
    ON a.PatientID = p.PatientID
INNER JOIN Clinician c
    ON a.ClinicianID = c.ClinicianID;
