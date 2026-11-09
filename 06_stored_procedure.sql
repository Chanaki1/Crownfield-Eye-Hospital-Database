USE crownfield_eye_hospital;
-- Matches the successful MySQL Workbench test on 9 November 2026.
DROP PROCEDURE IF EXISTS GetClinicianAppointments;
DELIMITER //
CREATE PROCEDURE GetClinicianAppointments(IN p_ClinicianID INT)
BEGIN
    SELECT a.AppointmentID, p.FirstName, p.LastName, a.AppointmentDate
    FROM Appointment AS a
    INNER JOIN Patient AS p ON a.PatientID = p.PatientID
    WHERE a.ClinicianID = p_ClinicianID;
END //
DELIMITER ;
CALL GetClinicianAppointments(1);
