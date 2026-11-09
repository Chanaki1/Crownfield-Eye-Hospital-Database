USE crownfield_eye_hospital;

-- Query 6: Trigger
-- Prevents a follow-up date being earlier than the appointment date

DROP TRIGGER IF EXISTS CheckFollowUpDate;

DELIMITER //

CREATE TRIGGER CheckFollowUpDate
BEFORE INSERT ON FollowUpPlan
FOR EACH ROW
BEGIN
    IF NEW.DueDate < (
        SELECT AppointmentDate
        FROM Appointment
        WHERE AppointmentID = NEW.AppointmentID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Follow-up date cannot be before appointment date';
    END IF;
END //

DELIMITER ;