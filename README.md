# Crownfield Eye Hospital — Student 1 database project

This repository contains the **fictional** ophthalmology database prototype, supporting SQL examples, screenshots, ER diagram, normalisation evidence, report and presentation.

## Files and order

- `sql/01_database_export.sql` — existing MySQL Workbench database export, including table definitions and fictional records. **Warning:** This is a database dump, not a hand-ordered clean-build script. Review the database name and existing tables before importing; a dump can overwrite tables.
- `sql/02_inner_join.sql` — three-table INNER JOIN.
- `sql/03_left_join.sql` — Appointment with optional FollowUpPlan.
- `sql/04_group_by_having.sql` — clinician appointment counts.
- `sql/05_subquery.sql` — patients who saw Dr Maya Shah.
- `sql/06_stored_procedure.sql` — `GetClinicianAppointments(1)`, matching the successful MySQL Workbench screenshot.
- `sql/07_trigger.sql` — `CheckFollowUpDate`, rejects an earlier follow-up date on INSERT.
- `sql/08_security_roles.sql` — **new proposed MySQL 8 roles/privileges script** based on the project schema; must be run and tested before describing it as executed evidence.
- `evidence/sql-tests/` — screenshots for each of the six SQL features, including the latest successful procedure test.
- `evidence/security-transactions/` — existing role, hashing, COMMIT and ROLLBACK screenshots.
- `design/` — ER diagram and UNF→3NF images.
- `reports/`, `presentation/` — Student 1's prepared submission materials.

## How to review the SQL

1. In MySQL Workbench, select or restore the `crownfield_eye_hospital` database using the provided export **only if it is safe to do so**. It may contain DROP TABLE statements.
2. Run the numbered SQL feature files one at a time, in order, after confirming the schema exists.
3. The stored procedure test is `CALL GetClinicianAppointments(1);`. The latest test screenshot shows two rows (Amina Yusuf and Sofia Bennett).
4. For the trigger, the screenshot demonstrates an invalid follow-up date being rejected. Do not run invalid INSERT tests against important data.

## Evidence limitations

The SQL examples and screenshots were assembled from existing group project files and the latest user-provided successful stored procedure test. They support the functionality shown, **but do not establish who personally authored each script**. Student 1 should check that the individual contribution statements in the report and presentation accurately describe their own work.

The original evidence archive did not contain a readable standalone security/roles SQL file. A **new proposed** script is provided at `sql/08_security_roles.sql`, but it is **not** verified as the exact script used for the existing screenshots or tested on MySQL. Run and test it separately before claiming it as executed work. The ER diagram at `design/ER_diagram.png` was visually checked and is the updated Crow's Foot version with one-or-many PrescriptionItems.

No live MySQL execution or GitHub upload was performed while assembling this package.
