-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ========================
-- USERS (10 total)
-- ========================
INSERT INTO users (user_id, national_id, first_name, last_name, phone_number, email)
VALUES
    ('11111111-1111-1111-1111-111111111111', '1001', 'Alice', 'Smith', '555-0100', 'alice@example.com'),
    ('22222222-2222-2222-2222-222222222222', '1002', 'Bob', 'Johnson', '555-0101', 'bob@example.com'),
    ('33333333-3333-3333-3333-333333333333', '1003', 'Charlie', 'Williams', '555-0102', 'charlie@example.com'),
    ('44444444-4444-4444-4444-444444444444', '1004', 'Diana', 'Brown', '555-0103', 'diana@example.com'),
    ('55555555-5555-5555-5555-555555555555', '1005', 'Ethan', 'Davis', '555-0104', 'ethan@example.com'),
    ('66666666-6666-6666-6666-666666666666', '1006', 'Fiona', 'Miller', '555-0105', 'fiona@example.com'),
    ('77777777-7777-7777-7777-777777777777', '1007', 'George', 'Wilson', '555-0106', 'george@example.com'),
    ('88888888-8888-8888-8888-888888888888', '1008', 'Hannah', 'Moore', '555-0107', 'hannah@example.com'),
    ('99999999-9999-9999-9999-999999999999', '1009', 'Ian', 'Taylor', '555-0108', 'ian@example.com'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '1010', 'Julia', 'Anderson', '555-0109', 'julia@example.com');

-- ========================
-- BRANCHES (3 total)
-- ========================
INSERT INTO branches (branch_id, branch_name, street_number, street_name, city, province, postal_code, phone_number, email)
VALUES
    ('b1111111-1111-1111-1111-111111111111', 'Downtown Branch', '123', 'Main St', 'Metropolis', 'ProvinceA', '12345', '555-1000', 'downtown@company.com'),
    ('b2222222-2222-2222-2222-222222222222', 'Uptown Branch', '456', 'High St', 'Metropolis', 'ProvinceA', '12346', '555-1001', 'uptown@company.com'),
    ('b3333333-3333-3333-3333-333333333333', 'Suburb Branch', '789', 'Elm St', 'Metropolis', 'ProvinceA', '12347', '555-1002', 'suburb@company.com');

-- ========================
-- CLIENTS (10 total, all users)
-- ========================
INSERT INTO clients (client_id, user_id, ce_number)
VALUES
    (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', 'CE-1001'),
    (gen_random_uuid(), '22222222-2222-2222-2222-222222222222', 'CE-1002'),
    (gen_random_uuid(), '33333333-3333-3333-3333-333333333333', 'CE-1003'),
    (gen_random_uuid(), '44444444-4444-4444-4444-444444444444', 'CE-1004'),
    (gen_random_uuid(), '55555555-5555-5555-5555-555555555555', 'CE-1005'),
    (gen_random_uuid(), '66666666-6666-6666-6666-666666666666', 'CE-1006'),
    (gen_random_uuid(), '77777777-7777-7777-7777-777777777777', 'CE-1007'),
    (gen_random_uuid(), '88888888-8888-8888-8888-888888888888', 'CE-1008'),
    (gen_random_uuid(), '99999999-9999-9999-9999-999999999999', 'CE-1009'),
    (gen_random_uuid(), 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'CE-1010');

-- ========================
-- EMPLOYEES (5 total, subset of clients)
-- ========================
INSERT INTO employees (employee_id, user_id, cp_number, branch_id, work_email)
VALUES
    (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', 'CP-1001', 'b1111111-1111-1111-1111-111111111111', 'alice@company.com'),
    (gen_random_uuid(), '22222222-2222-2222-2222-222222222222', 'CP-1002', 'b1111111-1111-1111-1111-111111111111', 'bob@company.com'),
    (gen_random_uuid(), '33333333-3333-3333-3333-333333333333', 'CP-1003', 'b2222222-2222-2222-2222-222222222222', 'charlie@company.com'),
    (gen_random_uuid(), '44444444-4444-4444-4444-444444444444', 'CP-1004', 'b2222222-2222-2222-2222-222222222222', 'diana@company.com'),
    (gen_random_uuid(), '55555555-5555-5555-5555-555555555555', 'CP-1005', 'b3333333-3333-3333-3333-333333333333', 'ethan@company.com');

-- ========================
-- CREDENTIALS (10 total)
-- ========================
INSERT INTO credentials (credential_id, user_id, username, password_hash)
VALUES
    (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', 'alice', 'hashedpwd1'),
    (gen_random_uuid(), '22222222-2222-2222-2222-222222222222', 'bob', 'hashedpwd2'),
    (gen_random_uuid(), '33333333-3333-3333-3333-333333333333', 'charlie', 'hashedpwd3'),
    (gen_random_uuid(), '44444444-4444-4444-4444-444444444444', 'diana', 'hashedpwd4'),
    (gen_random_uuid(), '55555555-5555-5555-5555-555555555555', 'ethan', 'hashedpwd5'),
    (gen_random_uuid(), '66666666-6666-6666-6666-666666666666', 'fiona', 'hashedpwd6'),
    (gen_random_uuid(), '77777777-7777-7777-7777-777777777777', 'george', 'hashedpwd7'),
    (gen_random_uuid(), '88888888-8888-8888-8888-888888888888', 'hannah', 'hashedpwd8'),
    (gen_random_uuid(), '99999999-9999-9999-9999-999999999999', 'ian', 'hashedpwd9'),
    (gen_random_uuid(), 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'julia', 'hashedpwd10');

-- ========================
-- CASE TYPES (5 total)
-- ========================
INSERT INTO case_types (case_type_id, case_type_name)
VALUES
    (gen_random_uuid(), 'Type A'),
    (gen_random_uuid(), 'Type B'),
    (gen_random_uuid(), 'Type C'),
    (gen_random_uuid(), 'Type D'),
    (gen_random_uuid(), 'Type E');

-- ========================
-- PRODUCT CATEGORIES (5 total)
-- ========================
INSERT INTO product_categories (category_id, category_name)
VALUES
    (gen_random_uuid(), 'Category A'),
    (gen_random_uuid(), 'Category B'),
    (gen_random_uuid(), 'Category C'),
    (gen_random_uuid(), 'Category D'),
    (gen_random_uuid(), 'Category E');

-- ========================
-- PRODUCTS (5 total)
-- ========================
INSERT INTO products (product_id, product_name, category_id)
VALUES
    (gen_random_uuid(), 'Product 1', (SELECT category_id FROM product_categories LIMIT 1 OFFSET 0)),
    (gen_random_uuid(), 'Product 2', (SELECT category_id FROM product_categories LIMIT 1 OFFSET 1)),
    (gen_random_uuid(), 'Product 3', (SELECT category_id FROM product_categories LIMIT 1 OFFSET 2)),
    (gen_random_uuid(), 'Product 4', (SELECT category_id FROM product_categories LIMIT 1 OFFSET 3)),
    (gen_random_uuid(), 'Product 5', (SELECT category_id FROM product_categories LIMIT 1 OFFSET 4));

-- ========================
-- TIME SLOTS (5 total)
-- ========================
INSERT INTO time_slots (slot_id, start_time, end_time, slot_label)
VALUES
    (gen_random_uuid(), '09:00', '10:00', 'Morning Slot'),
    (gen_random_uuid(), '10:00', '11:00', 'Late Morning'),
    (gen_random_uuid(), '11:00', '12:00', 'Noon Slot'),
    (gen_random_uuid(), '13:00', '14:00', 'Afternoon'),
    (gen_random_uuid(), '14:00', '15:00', 'Late Afternoon');

-- ========================
-- BRANCH BUSINESS HOURS
-- ========================
INSERT INTO branch_business_hours (hours_id, branch_id, day_of_week, open_time, close_time)
VALUES
    (gen_random_uuid(), 'b1111111-1111-1111-1111-111111111111', 1, '09:00', '17:00'),
    (gen_random_uuid(), 'b1111111-1111-1111-1111-111111111111', 2, '09:00', '17:00'),
    (gen_random_uuid(), 'b2222222-2222-2222-2222-222222222222', 1, '08:00', '16:00'),
    (gen_random_uuid(), 'b2222222-2222-2222-2222-222222222222', 2, '08:00', '16:00'),
    (gen_random_uuid(), 'b3333333-3333-3333-3333-333333333333', 1, '10:00', '18:00');

-- ========================
-- APPOINTMENTS (5 total)
-- ========================
INSERT INTO appointments (appointment_id, client_id, employee_id, branch_id, product_id, case_type_id, appointment_date, start_time, end_time, status, notes)
VALUES
    (gen_random_uuid(), (SELECT client_id FROM clients WHERE user_id='11111111-1111-1111-1111-111111111111'), (SELECT employee_id FROM employees WHERE user_id='11111111-1111-1111-1111-111111111111'), 'b1111111-1111-1111-1111-111111111111', (SELECT product_id FROM products LIMIT 1 OFFSET 0), (SELECT case_type_id FROM case_types LIMIT 1 OFFSET 0), '2025-12-20', '09:00', '10:00', 'Scheduled', 'Initial appointment'),
    (gen_random_uuid(), (SELECT client_id FROM clients WHERE user_id='22222222-2222-2222-2222-222222222222'), (SELECT employee_id FROM employees WHERE user_id='22222222-2222-2222-2222-222222222222'), 'b1111111-1111-1111-1111-111111111111', (SELECT product_id FROM products LIMIT 1 OFFSET 1), (SELECT case_type_id FROM case_types LIMIT 1 OFFSET 1), '2025-12-21', '10:00', '11:00', 'Scheduled', 'Follow-up'),
    (gen_random_uuid(), (SELECT client_id FROM clients WHERE user_id='33333333-3333-3333-3333-333333333333'), (SELECT employee_id FROM employees WHERE user_id='33333333-3333-3333-3333-333333333333'), 'b2222222-2222-2222-2222-222222222222', (SELECT product_id FROM products LIMIT 1 OFFSET 2), (SELECT case_type_id FROM case_types LIMIT 1 OFFSET 2), '2025-12-22', '11:00', '12:00', 'Scheduled', ''),
    (gen_random_uuid(), (SELECT client_id FROM clients WHERE user_id='44444444-4444-4444-4444-444444444444'), (SELECT employee_id FROM employees WHERE user_id='44444444-4444-4444-4444-444444444444'), 'b2222222-2222-2222-2222-222222222222', (SELECT product_id FROM products LIMIT 1 OFFSET 3), (SELECT case_type_id FROM case_types LIMIT 1 OFFSET 3), '2025-12-23', '13:00', '14:00', 'Scheduled', ''),
    (gen_random_uuid(), (SELECT client_id FROM clients WHERE user_id='55555555-5555-5555-5555-555555555555'), (SELECT employee_id FROM employees WHERE user_id='55555555-5555-5555-5555-555555555555'), 'b3333333-3333-3333-3333-333333333333', (SELECT product_id FROM products LIMIT 1 OFFSET 4), (SELECT case_type_id FROM case_types LIMIT 1 OFFSET 4), '2025-12-24', '14:00', '15:00', 'Scheduled', 'First appointment');
