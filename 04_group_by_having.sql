
USE crownfield_eye_hospital;

SELECT
    c.ClinicianName,
    COUNT(a.AppointmentID) AS TotalAppointments
FROM Clinician AS c
INNER JOIN Appointment AS a
    ON c.ClinicianID = a.ClinicianID
GROUP BY c.ClinicianID, c.ClinicianName
HAVING COUNT(a.AppointmentID) >= 1
ORDER BY TotalAppointments DESC;

