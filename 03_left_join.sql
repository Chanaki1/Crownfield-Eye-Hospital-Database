
USE crownfield_eye_hospital;

SELECT
    a.AppointmentID,
    a.AppointmentDate,
    f.DueDate,
    f.Status
FROM Appointment AS a
LEFT JOIN FollowUpPlan AS f
    ON a.AppointmentID = f.AppointmentID
ORDER BY a.AppointmentID;

