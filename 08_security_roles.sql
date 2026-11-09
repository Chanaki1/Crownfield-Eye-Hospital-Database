-- Crownfield Eye Hospital: proposed security/roles script (MySQL 8.0+)
-- Prepared from the final 11-table schema. NOT verified against a live MySQL server.
-- Run as a database administrator after creating the crownfield_eye_hospital schema.
-- Uses roles only; no user accounts or passwords are created.

CREATE ROLE IF NOT EXISTS 'hospital_admin', 'hospital_doctor', 'hospital_receptionist', 'hospital_patient';

-- Administrator: full data access within the project database.
GRANT SELECT, INSERT, UPDATE, DELETE ON crownfield_eye_hospital.* TO 'hospital_admin';

-- Doctor: view clinical records and record diagnoses, prescriptions and follow-up plans.
GRANT SELECT ON crownfield_eye_hospital.* TO 'hospital_doctor';
GRANT INSERT, UPDATE ON crownfield_eye_hospital.appointmentdiagnosis TO 'hospital_doctor';
GRANT INSERT, UPDATE ON crownfield_eye_hospital.prescription TO 'hospital_doctor';
GRANT INSERT, UPDATE ON crownfield_eye_hospital.prescriptionitem TO 'hospital_doctor';
GRANT INSERT, UPDATE ON crownfield_eye_hospital.followupplan TO 'hospital_doctor';

-- Receptionist: maintain patient and appointment details, but not prescriptions or diagnoses.
GRANT SELECT, INSERT, UPDATE ON crownfield_eye_hospital.patient TO 'hospital_receptionist';
GRANT SELECT, INSERT, UPDATE ON crownfield_eye_hospital.appointment TO 'hospital_receptionist';
GRANT SELECT ON crownfield_eye_hospital.clinic TO 'hospital_receptionist';
GRANT SELECT ON crownfield_eye_hospital.clinician TO 'hospital_receptionist';

-- Patient: demonstration role with read access to general reference information only.
-- IMPORTANT: Granting SELECT on patient/appointment tables would expose ALL rows;
-- a real patient portal needs row-level restrictions through an application or secure views.
GRANT SELECT ON crownfield_eye_hospital.clinic TO 'hospital_patient';
GRANT SELECT ON crownfield_eye_hospital.specialty TO 'hospital_patient';

-- Inspect role permissions (requires sufficient privileges):
SHOW GRANTS FOR 'hospital_admin';
SHOW GRANTS FOR 'hospital_doctor';
SHOW GRANTS FOR 'hospital_receptionist';
SHOW GRANTS FOR 'hospital_patient';

-- Optional safe hashing demonstration on a fictional example (not real patient data):
SELECT SHA2('fictional-demo-value', 256) AS ExampleSHA256;

-- Note: SHA2 is a demonstration, not a password-storage scheme.
-- Passwords should use a dedicated slow password-hashing algorithm in the application.
-- This script does not reproduce or prove the original screenshots' exact commands.
