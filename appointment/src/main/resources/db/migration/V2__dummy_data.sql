-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ========================
-- USERS (30 total)
-- ========================
INSERT INTO users (user_id, national_id, first_name, last_name, phone_number, email)
VALUES ('11111111-1111-1111-1111-111111111111', '9203155124083', 'Alice', 'Smith', '0825550100', 'alice@example.com'),
       ('22222222-2222-2222-2222-222222222222', '8507225089081', 'Bob', 'Johnson', '0715550101', 'bob@example.com'),
       ('33333333-3333-3333-3333-333333333333', '9011045211085', 'Charlie', 'Williams', '0635550102',
        'charlie@example.com'),
       ('44444444-4444-4444-4444-444444444444', '7812125143087', 'Diana', 'Brown', '0845550103', 'diana@example.com'),
       ('55555555-5555-5555-5555-555555555555', '9505205032082', 'Ethan', 'Davis', '0725550104', 'ethan@example.com'),
       ('66666666-6666-6666-6666-666666666666', '8209145198084', 'Fiona', 'Miller', '0615550105', 'fiona@example.com'),
       ('77777777-7777-7777-7777-777777777777', '8801305067089', 'George', 'Wilson', '0815550106',
        'george@example.com'),
       ('88888888-8888-8888-8888-888888888888', '9304185156086', 'Hannah', 'Moore', '0745550107', 'hannah@example.com'),
       ('99999999-9999-9999-9999-999999999999', '8110055272080', 'Ian', 'Taylor', '0655550108', 'ian@example.com'),
       ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '9706115045088', 'Julia', 'Anderson', '0835550109',
        'julia@example.com'),
       ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '8902145123081', 'Kevin', 'Mokoena', '0821234567',
        'kevin.m@example.com'),
       ('cccccccc-cccc-cccc-cccc-cccccccccccc', '9407285098084', 'Laura', 'Naidoo', '0712345678',
        'laura.n@example.com'),
       ('dddddddd-dddd-dddd-dddd-dddddddddddd', '8112055112087', 'Michael', 'Ndlovu', '0633456789',
        'michael.n@example.com'),
       ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '9005195045082', 'Nicole', 'Pretorius', '0844567890',
        'nicole.p@example.com'),
       ('ffffffff-ffff-ffff-ffff-ffffffffffff', '8710315234085', 'Oscar', 'Van Wyk', '0725678901',
        'oscar.v@example.com'),
       ('12121212-1212-1212-1212-121212121212', '9601155076089', 'Patricia', 'Gumede', '0616789012',
        'patricia.g@example.com'),
       ('13131313-1313-1313-1313-131313131313', '8308225189083', 'Quinton', 'Jacobs', '0817890123',
        'quinton.j@example.com'),
       ('14141414-1414-1414-1414-141414141414', '9204105054086', 'Rachel', 'Smit', '0748901234',
        'rachel.s@example.com'),
       ('15151515-1515-1515-1515-151515151515', '8811255267080', 'Samuel', 'Botha', '0659012345',
        'samuel.b@example.com'),
       ('16161616-1616-1616-1616-161616161616', '9506305021088', 'Thabo', 'Molefe', '0830123456',
        'thabo.m@example.com'),
       ('17171717-1717-1717-1717-171717171717', '8203085144081', 'Ursula', 'Dlamini', '0761234567',
        'ursula.d@example.com'),
       ('18181818-1818-1818-1818-181818181818', '9109125213084', 'Victor', 'Zondi', '0602345678',
        'victor.z@example.com'),
       ('19191919-1919-1919-1919-191919191919', '8505055088087', 'Wendy', 'Mbeki', '0823456789', 'wendy.m@example.com'),
       ('20202020-2020-2020-2020-202020202020', '9712125199082', 'Xolani', 'Khumalo', '0714567890',
        'xolani.k@example.com'),
       ('21212121-2121-2121-2121-212121212121', '8401205033085', 'Yolanda', 'Govender', '0635678901',
        'yolanda.g@example.com'),
       ('22222222-3333-4444-5555-666666666666', '9310145244089', 'Zane', 'Marais', '0846789012', 'zane.m@example.com'),
       ('23232323-2323-2323-2323-232323232323', '8602285155083', 'Adrian', 'Pillay', '0727890123',
        'adrian.p@example.com'),
       ('24242424-2424-2424-2424-242424242424', '9803175066086', 'Beatrice', 'Lombard', '0618901234',
        'beatrice.l@example.com'),
       ('25252525-2525-2525-2525-252525252525', '8011215277080', 'Cedric', 'Nkosi', '0819012345',
        'cedric.n@example.com'),
       ('26262626-2626-2626-2626-262626262626', '9908045041088', 'Dineo', 'Seboko', '0740123456',
        'dineo.s@example.com');

-- ========================
-- BRANCHES (20 total)
-- ========================
INSERT INTO branches (branch_id, branch_name, street_number, street_name, city, province, postal_code, phone_number,
                      email)
VALUES ('b1111111-1111-1111-1111-111111111111', 'Cape Town Branch', '12', 'Main Street', 'Cape Town', 'Western Cape',
        '8001', '0873568654', 'capetown@capitecbank.co.za'),
       ('b2222222-2222-2222-2222-222222222222', 'Strand Branch', '45', 'High Street', 'Cape Town', 'Western Cape',
        '7349', '0899722323', 'strand@capitecbank.co.za'),
       ('b3333333-3333-3333-3333-333333333333', 'Stellenbosch Branch', '89', 'Neutron Street', 'Cape Town',
        'Western Cape ', '7005', '0798769792', 'stellenbosch@capitecbank.co.za'),
       ('b4444444-4444-4444-4444-444444444444', 'Sandton City Branch', '158', 'Rivonia Road', 'Sandton', 'Gauteng',
        '2196', '0825552001', 'sandtoncity@capitecbank.co.za'),
       ('b5555555-5555-5555-5555-555555555555', 'Umhlanga Rocks Branch', '22', 'Lagoon Drive', 'Umhlanga',
        'KwaZulu-Natal', '4319', '0715552002', 'umhlangarocks@capitecbank.co.za'),
       ('b6666666-6666-6666-6666-666666666666', 'Gqeberha Central Branch', '412', 'Govan Mbeki Avenue', 'Gqeberha',
        'Eastern Cape', '6001', '0635552003', 'gqeberhacentral@capitecbank.co.za'),
       ('b7777777-7777-7777-7777-777777777777', 'Bloemfontein Waterfront Branch', '12', 'Kellner Street',
        'Bloemfontein', 'Free State', '9301', '0845552004', 'bloemfonteinwaterfront@capitecbank.co.za'),
       ('b8888888-8888-8888-8888-888888888888', 'Polokwane Mall Branch', '88', 'Market Street', 'Polokwane', 'Limpopo',
        '0699', '0725552005', 'polokwanemall@capitecbank.co.za'),
       ('b9999999-9999-9999-9999-999999999999', 'Mbombela Square Branch', '5', 'Samora Machel Drive', 'Mbombela',
        'Mpumalanga', '1201', '0615552006', 'mbombelasquare@capitecbank.co.za'),
       ('baaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Kimberley North Branch', '101', 'Bultfontein Road', 'Kimberley',
        'Northern Cape', '8301', '0815552007', 'kimberleynorth@capitecbank.co.za'),
       ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Rustenburg CBD Branch', '34', 'Nelson Mandela Drive', 'Rustenburg',
        'North West', '0299', '0745552008', 'rustenburgcbd@capitecbank.co.za'),
       ('bccccccc-cccc-cccc-cccc-cccccccccccc', 'Menlyn Maine Branch', '210', 'January Masilela Drive', 'Pretoria',
        'Gauteng', '0181', '0655552009', 'menlynmaine@capitecbank.co.za'),
       ('bddddddd-dddd-dddd-dddd-dddddddddddd', 'Durban North Branch', '67', 'Adelaide Tambo Drive', 'Durban',
        'KwaZulu-Natal', '4051', '0835552010', 'durbannorth@capitecbank.co.za'),
       ('beeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'George Loerie Branch', '14', 'York Street', 'George', 'Western Cape',
        '6529', '0765552011', 'georgeloerie@capitecbank.co.za'),
       ('bfffffff-ffff-ffff-ffff-ffffffffffff', 'Potchefstroom University Branch', '52', 'Steve Biko Street',
        'Potchefstroom', 'North West', '2531', '0605552012', 'potchefstroomuniversity@capitecbank.co.za'),
       ('b0000000-1111-2222-3333-444444444444', 'East London City Branch', '9', 'Oxford Street', 'East London',
        'Eastern Cape', '5201', '0825552013', 'eastlondoncity@capitecbank.co.za'),
       ('b1111111-2222-3333-4444-555555555555', 'Soweto Maponya Branch', '20', 'Chris Hani Road', 'Soweto', 'Gauteng',
        '1862', '0715552014', 'sowetomaponya@capitecbank.co.za'),
       ('b2222222-3333-4444-5555-666666666666', 'Klerksdorp Mall Branch', '7', 'Joe Slovo Road', 'Klerksdorp',
        'North West', '2571', '0635552015', 'klerksdorpmall@capitecbank.co.za'),
       ('b3333333-4444-5555-6666-777777777777', 'Welkom CBD Branch', '201', 'Stateway', 'Welkom', 'Free State', '9459',
        '0845552016', 'welkomcbd@capitecbank.co.za'),
       ('b4444444-5555-6666-7777-888888888888', 'Century City Branch', '1', 'Century Boulevard', 'Cape Town',
        'Western Cape', '7441', '0725552017', 'centurycity@capitecbank.co.za');

-- ========================
-- CLIENTS (10 total, all users)
-- ========================
INSERT INTO clients (client_id, user_id, ce_number)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', 'CE-1001'),
       (gen_random_uuid(), '22222222-2222-2222-2222-222222222222', 'CE-1002'),
       (gen_random_uuid(), '33333333-3333-3333-3333-333333333333', 'CE-1003'),
       (gen_random_uuid(), '44444444-4444-4444-4444-444444444444', 'CE-1004'),
       (gen_random_uuid(), '55555555-5555-5555-5555-555555555555', 'CE-1005'),
       (gen_random_uuid(), '66666666-6666-6666-6666-666666666666', 'CE-1006'),
       (gen_random_uuid(), '77777777-7777-7777-7777-777777777777', 'CE-1007'),
       (gen_random_uuid(), '88888888-8888-8888-8888-888888888888', 'CE-1008'),
       (gen_random_uuid(), '99999999-9999-9999-9999-999999999999', 'CE-1009'),
       (gen_random_uuid(), 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'CE-1010'),
       (gen_random_uuid(), 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'CE-1011'),
       (gen_random_uuid(), 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'CE-1012'),
       (gen_random_uuid(), 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'CE-1013'),
       (gen_random_uuid(), 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'CE-1014'),
       (gen_random_uuid(), 'ffffffff-ffff-ffff-ffff-ffffffffffff', 'CE-1015'),
       (gen_random_uuid(), '12121212-1212-1212-1212-121212121212', 'CE-1016'),
       (gen_random_uuid(), '13131313-1313-1313-1313-131313131313', 'CE-1017'),
       (gen_random_uuid(), '14141414-1414-1414-1414-141414141414', 'CE-1018'),
       (gen_random_uuid(), '15151515-1515-1515-1515-151515151515', 'CE-1019'),
       (gen_random_uuid(), '16161616-1616-1616-1616-161616161616', 'CE-1020'),
       (gen_random_uuid(), '17171717-1717-1717-1717-171717171717', 'CE-1021'),
       (gen_random_uuid(), '18181818-1818-1818-1818-181818181818', 'CE-1022'),
       (gen_random_uuid(), '19191919-1919-1919-1919-191919191919', 'CE-1023'),
       (gen_random_uuid(), '20202020-2020-2020-2020-202020202020', 'CE-1024'),
       (gen_random_uuid(), '21212121-2121-2121-2121-212121212121', 'CE-1025'),
       (gen_random_uuid(), '22222222-3333-4444-5555-666666666666', 'CE-1026'),
       (gen_random_uuid(), '23232323-2323-2323-2323-232323232323', 'CE-1027'),
       (gen_random_uuid(), '24242424-2424-2424-2424-242424242424', 'CE-1028'),
       (gen_random_uuid(), '25252525-2525-2525-2525-252525252525', 'CE-1029'),
       (gen_random_uuid(), '26262626-2626-2626-2626-262626262626', 'CE-1030');

-- ========================================================
-- EMPLOYEES (30 total, mapping all users to branches)
-- ========================================================
INSERT INTO employees (employee_id, user_id, cp_number, branch_id, work_email)
VALUES
    -- Users 1-5 (Initial group)
    (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', 'CP-1001', 'b1111111-1111-1111-1111-111111111111',
     'alice.smith@capitecbank.co.za'),
    (gen_random_uuid(), '22222222-2222-2222-2222-222222222222', 'CP-1002', 'b1111111-1111-1111-1111-111111111111',
     'bob.johnson@capitecbank.co.za'),
    (gen_random_uuid(), '33333333-3333-3333-3333-333333333333', 'CP-1003', 'b2222222-2222-2222-2222-222222222222',
     'charlie.williams@capitecbank.co.za'),
    (gen_random_uuid(), '44444444-4444-4444-4444-444444444444', 'CP-1004', 'b2222222-2222-2222-2222-222222222222',
     'diana.brown@capitecbank.co.za'),
    (gen_random_uuid(), '55555555-5555-5555-5555-555555555555', 'CP-1005', 'b3333333-3333-3333-3333-333333333333',
     'ethan.davis@capitecbank.co.za'),

    -- Users 6-10
    (gen_random_uuid(), '66666666-6666-6666-6666-666666666666', 'CP-1006', 'b4444444-4444-4444-4444-444444444444',
     'fiona.miller@capitecbank.co.za'),
    (gen_random_uuid(), '77777777-7777-7777-7777-777777777777', 'CP-1007', 'b5555555-5555-5555-5555-555555555555',
     'george.wilson@capitecbank.co.za'),
    (gen_random_uuid(), '88888888-8888-8888-8888-888888888888', 'CP-1008', 'b6666666-6666-6666-6666-666666666666',
     'hannah.moore@capitecbank.co.za'),
    (gen_random_uuid(), '99999999-9999-9999-9999-999999999999', 'CP-1009', 'b7777777-7777-7777-7777-777777777777',
     'ian.taylor@capitecbank.co.za'),
    (gen_random_uuid(), 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'CP-1010', 'b8888888-8888-8888-8888-888888888888',
     'julia.anderson@capitecbank.co.za'),

    -- Users 11-15
    (gen_random_uuid(), 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'CP-1011', 'b9999999-9999-9999-9999-999999999999',
     'kevin.mokoena@capitecbank.co.za'),
    (gen_random_uuid(), 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'CP-1012', 'baaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
     'laura.naidoo@capitecbank.co.za'),
    (gen_random_uuid(), 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'CP-1013', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
     'michael.ndlovu@capitecbank.co.za'),
    (gen_random_uuid(), 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'CP-1014', 'bccccccc-cccc-cccc-cccc-cccccccccccc',
     'nicole.pretorius@capitecbank.co.za'),
    (gen_random_uuid(), 'ffffffff-ffff-ffff-ffff-ffffffffffff', 'CP-1015', 'bddddddd-dddd-dddd-dddd-dddddddddddd',
     'oscar.vanwyk@capitecbank.co.za'),

    -- Users 16-20
    (gen_random_uuid(), '12121212-1212-1212-1212-121212121212', 'CP-1016', 'beeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
     'patricia.gumede@capitecbank.co.za'),
    (gen_random_uuid(), '13131313-1313-1313-1313-131313131313', 'CP-1017', 'bfffffff-ffff-ffff-ffff-ffffffffffff',
     'quinton.jacobs@capitecbank.co.za'),
    (gen_random_uuid(), '14141414-1414-1414-1414-141414141414', 'CP-1018', 'b0000000-1111-2222-3333-444444444444',
     'rachel.smit@capitecbank.co.za'),
    (gen_random_uuid(), '15151515-1515-1515-1515-151515151515', 'CP-1019', 'b1111111-2222-3333-4444-555555555555',
     'samuel.botha@capitecbank.co.za'),
    (gen_random_uuid(), '16161616-1616-1616-1616-161616161616', 'CP-1020', 'b2222222-3333-4444-5555-666666666666',
     'thabo.molefe@capitecbank.co.za'),

    -- Users 21-25
    (gen_random_uuid(), '17171717-1717-1717-1717-171717171717', 'CP-1021', 'b3333333-4444-5555-6666-777777777777',
     'ursula.dlamini@capitecbank.co.za'),
    (gen_random_uuid(), '18181818-1818-1818-1818-181818181818', 'CP-1022', 'b4444444-5555-6666-7777-888888888888',
     'victor.zondi@capitecbank.co.za'),
    (gen_random_uuid(), '19191919-1919-1919-1919-191919191919', 'CP-1023', 'b1111111-1111-1111-1111-111111111111',
     'wendy.mbeki@capitecbank.co.za'),
    (gen_random_uuid(), '20202020-2020-2020-2020-202020202020', 'CP-1024', 'b2222222-2222-2222-2222-222222222222',
     'xolani.khumalo@capitecbank.co.za'),
    (gen_random_uuid(), '21212121-2121-2121-2121-212121212121', 'CP-1025', 'b3333333-3333-3333-3333-333333333333',
     'yolanda.govender@capitecbank.co.za'),

    -- Users 26-30
    (gen_random_uuid(), '22222222-3333-4444-5555-666666666666', 'CP-1026', 'b4444444-4444-4444-4444-444444444444',
     'zane.marais@capitecbank.co.za'),
    (gen_random_uuid(), '23232323-2323-2323-2323-232323232323', 'CP-1027', 'b5555555-5555-5555-5555-555555555555',
     'adrian.pillay@capitecbank.co.za'),
    (gen_random_uuid(), '24242424-2424-2424-2424-242424242424', 'CP-1028', 'b6666666-6666-6666-6666-666666666666',
     'beatrice.lombard@capitecbank.co.za'),
    (gen_random_uuid(), '25252525-2525-2525-2525-252525252525', 'CP-1029', 'b7777777-7777-7777-7777-777777777777',
     'cedric.nkosi@capitecbank.co.za'),
    (gen_random_uuid(), '26262626-2626-2626-2626-262626262626', 'CP-1030', 'b8888888-8888-8888-8888-888888888888',
     'dineo.seboko@capitecbank.co.za');

-- ========================
-- CREDENTIALS (10 total)
-- ========================
INSERT INTO credentials (credential_id, user_id, username, password_hash)
VALUES (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', 'alice.smith', 'hash_alice_01'),
       (gen_random_uuid(), '22222222-2222-2222-2222-222222222222', 'bob.johnson', 'hash_bob_02'),
       (gen_random_uuid(), '33333333-3333-3333-3333-333333333333', 'charlie.williams', 'hash_charlie_03'),
       (gen_random_uuid(), '44444444-4444-4444-4444-444444444444', 'diana.brown', 'hash_diana_04'),
       (gen_random_uuid(), '55555555-5555-5555-5555-555555555555', 'ethan.davis', 'hash_ethan_05'),
       (gen_random_uuid(), '66666666-6666-6666-6666-666666666666', 'fiona.miller', 'hash_fiona_06'),
       (gen_random_uuid(), '77777777-7777-7777-7777-777777777777', 'george.wilson', 'hash_george_07'),
       (gen_random_uuid(), '88888888-8888-8888-8888-888888888888', 'hannah.moore', 'hash_hannah_08'),
       (gen_random_uuid(), '99999999-9999-9999-9999-999999999999', 'ian.taylor', 'hash_ian_09'),
       (gen_random_uuid(), 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'julia.anderson', 'hash_julia_10'),

       -- Remaining 20
       (gen_random_uuid(), 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'kevin.mokoena', 'hash_kevin_11'),
       (gen_random_uuid(), 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'laura.naidoo', 'hash_laura_12'),
       (gen_random_uuid(), 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'michael.ndlovu', 'hash_michael_13'),
       (gen_random_uuid(), 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'nicole.pretorius', 'hash_nicole_14'),
       (gen_random_uuid(), 'ffffffff-ffff-ffff-ffff-ffffffffffff', 'oscar.vanwyk', 'hash_oscar_15'),
       (gen_random_uuid(), '12121212-1212-1212-1212-121212121212', 'patricia.gumede', 'hash_patricia_16'),
       (gen_random_uuid(), '13131313-1313-1313-1313-131313131313', 'quinton.jacobs', 'hash_quinton_17'),
       (gen_random_uuid(), '14141414-1414-1414-1414-141414141414', 'rachel.smit', 'hash_rachel_18'),
       (gen_random_uuid(), '15151515-1515-1515-1515-151515151515', 'samuel.botha', 'hash_samuel_19'),
       (gen_random_uuid(), '16161616-1616-1616-1616-161616161616', 'thabo.molefe', 'hash_thabo_20'),
       (gen_random_uuid(), '17171717-1717-1717-1717-171717171717', 'ursula.dlamini', 'hash_ursula_21'),
       (gen_random_uuid(), '18181818-1818-1818-1818-181818181818', 'victor.zondi', 'hash_victor_22'),
       (gen_random_uuid(), '19191919-1919-1919-1919-191919191919', 'wendy.mbeki', 'hash_wendy_23'),
       (gen_random_uuid(), '20202020-2020-2020-2020-202020202020', 'xolani.khumalo', 'hash_xolani_24'),
       (gen_random_uuid(), '21212121-2121-2121-2121-212121212121', 'yolanda.govender', 'hash_yolanda_25'),
       (gen_random_uuid(), '22222222-3333-4444-5555-666666666666', 'zane.marais', 'hash_zane_26'),
       (gen_random_uuid(), '23232323-2323-2323-2323-232323232323', 'adrian.pillay', 'hash_adrian_27'),
       (gen_random_uuid(), '24242424-2424-2424-2424-242424242424', 'beatrice.lombard', 'hash_beatrice_28'),
       (gen_random_uuid(), '25252525-2525-2525-2525-252525252525', 'cedric.nkosi', 'hash_cedric_29'),
       (gen_random_uuid(), '26262626-2626-2626-2626-262626262626', 'dineo.seboko', 'hash_dineo_30');

-- ========================
-- CASE TYPES (5 total)
-- ========================
INSERT INTO case_types (case_type_id, case_type_name)
VALUES (gen_random_uuid(), 'Urgent'),
       (gen_random_uuid(), 'General'),
       (gen_random_uuid(), 'Moderate'),
       (gen_random_uuid(), 'Low'),
       (gen_random_uuid(), 'Extreme');

-- ========================
-- PRODUCT CATEGORIES (5 total)
-- ========================
INSERT INTO product_categories (category_id, category_name)
VALUES (gen_random_uuid(), 'Transact'),
       (gen_random_uuid(), 'Save'),
       (gen_random_uuid(), 'Credit'),
       (gen_random_uuid(), 'Insure'),
       (gen_random_uuid(), 'Business Bank'),
       (gen_random_uuid(), 'Value-Added Services');

-- ========================
-- PRODUCTS (5 total)
-- ========================
INSERT INTO products (product_id, product_name, category_id)
VALUES
    -- TRANSACT
    (gen_random_uuid(), 'Global One Transactional Account',
     (SELECT category_id FROM product_categories WHERE category_name = 'Transact')),
    (gen_random_uuid(), 'Capitec Connect SIM & Data',
     (SELECT category_id FROM product_categories WHERE category_name = 'Transact')),

    -- SAVE
    (gen_random_uuid(), 'Access Anytime Savings',
     (SELECT category_id FROM product_categories WHERE category_name = 'Save')),
    (gen_random_uuid(), '7-Day Notice Deposit',
     (SELECT category_id FROM product_categories WHERE category_name = 'Save')),
    (gen_random_uuid(), '32-Day Notice Deposit',
     (SELECT category_id FROM product_categories WHERE category_name = 'Save')),
    (gen_random_uuid(), 'Fixed-Term Savings (6-60 Months)',
     (SELECT category_id FROM product_categories WHERE category_name = 'Save')),
    (gen_random_uuid(), 'Tax-Free Savings Account',
     (SELECT category_id FROM product_categories WHERE category_name = 'Save')),
    (gen_random_uuid(), 'EasyEquities Investment Platform',
     (SELECT category_id FROM product_categories WHERE category_name = 'Save')),

    -- CREDIT
    (gen_random_uuid(), 'Personal Loan (Lump Sum)',
     (SELECT category_id FROM product_categories WHERE category_name = 'Credit')),
    (gen_random_uuid(), 'Access Facility (Revolving)',
     (SELECT category_id FROM product_categories WHERE category_name = 'Credit')),
    (gen_random_uuid(), 'Capitec Credit Card',
     (SELECT category_id FROM product_categories WHERE category_name = 'Credit')),
    (gen_random_uuid(), 'Home Loan', (SELECT category_id FROM product_categories WHERE category_name = 'Credit')),
    (gen_random_uuid(), 'Vehicle Finance', (SELECT category_id FROM product_categories WHERE category_name = 'Credit')),
    (gen_random_uuid(), 'Education & Medical Loans',
     (SELECT category_id FROM product_categories WHERE category_name = 'Credit')),

    -- INSURE
    (gen_random_uuid(), 'Funeral Cover', (SELECT category_id FROM product_categories WHERE category_name = 'Insure')),
    (gen_random_uuid(), 'Life Cover', (SELECT category_id FROM product_categories WHERE category_name = 'Insure')),
    (gen_random_uuid(), 'Credit Insurance',
     (SELECT category_id FROM product_categories WHERE category_name = 'Insure')),

    -- BUSINESS BANK
    (gen_random_uuid(), 'Global Biz Account',
     (SELECT category_id FROM product_categories WHERE category_name = 'Business Bank')),
    (gen_random_uuid(), 'Business Rental Finance',
     (SELECT category_id FROM product_categories WHERE category_name = 'Business Bank')),
    (gen_random_uuid(), 'Print Card Machine',
     (SELECT category_id FROM product_categories WHERE category_name = 'Business Bank')),
    (gen_random_uuid(), 'Pro Card Machine',
     (SELECT category_id FROM product_categories WHERE category_name = 'Business Bank')),
    (gen_random_uuid(), 'Regulated Trust Account',
     (SELECT category_id FROM product_categories WHERE category_name = 'Business Bank')),

    -- VALUE-ADDED SERVICES
    (gen_random_uuid(), 'Live Better Rewards',
     (SELECT category_id FROM product_categories WHERE category_name = 'Value-Added Services')),
    (gen_random_uuid(), 'Bill Payments & Cash Send',
     (SELECT category_id FROM product_categories WHERE category_name = 'Value-Added Services')),
    (gen_random_uuid(), 'Vehicle License Renewal',
     (SELECT category_id FROM product_categories WHERE category_name = 'Value-Added Services'));

-- ========================
-- TIME SLOTS (5 total)
-- ========================
INSERT INTO time_slots (slot_id, start_time, end_time, slot_label)
VALUES (gen_random_uuid(), '09:00', '10:00', 'Morning Slot'),
       (gen_random_uuid(), '10:00', '11:00', 'Late Morning'),
       (gen_random_uuid(), '11:00', '12:00', 'Noon Slot'),
       -- Note: 12:00 - 13:00 typically reserved for lunch
       (gen_random_uuid(), '13:00', '14:00', 'Afternoon'),
       (gen_random_uuid(), '14:00', '15:00', 'Late Afternoon'),
       (gen_random_uuid(), '15:00', '16:00', 'Early Evening'),
       (gen_random_uuid(), '16:00', '17:00', 'Late Day'),
       (gen_random_uuid(), '17:00', '18:00', 'Closing Slot');

-- ========================
-- BRANCH BUSINESS HOURS
-- ========================
INSERT INTO branch_business_hours (hours_id, branch_id, day_of_week, open_time, close_time)
VALUES
    -- 1. Cape Town Branch (Standard)
    (gen_random_uuid(), 'b1111111-1111-1111-1111-111111111111', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b1111111-1111-1111-1111-111111111111', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b1111111-1111-1111-1111-111111111111', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b1111111-1111-1111-1111-111111111111', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b1111111-1111-1111-1111-111111111111', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b1111111-1111-1111-1111-111111111111', 'SATURDAY', '09:00', '13:00'),

-- 2. Strand Branch (Early Bird)
    (gen_random_uuid(), 'b2222222-2222-2222-2222-222222222222', 'MONDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b2222222-2222-2222-2222-222222222222', 'TUESDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b2222222-2222-2222-2222-222222222222', 'WEDNESDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b2222222-2222-2222-2222-222222222222', 'THURSDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b2222222-2222-2222-2222-222222222222', 'FRIDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b2222222-2222-2222-2222-222222222222', 'SATURDAY', '08:00', '11:00'),

-- 3. Stellenbosch Branch (Late/Uni)
    (gen_random_uuid(), 'b3333333-3333-3333-3333-333333333333', 'MONDAY', '10:00', '18:00'),
    (gen_random_uuid(), 'b3333333-3333-3333-3333-333333333333', 'TUESDAY', '10:00', '18:00'),
    (gen_random_uuid(), 'b3333333-3333-3333-3333-333333333333', 'WEDNESDAY', '10:00', '18:00'),
    (gen_random_uuid(), 'b3333333-3333-3333-3333-333333333333', 'THURSDAY', '10:00', '18:00'),
    (gen_random_uuid(), 'b3333333-3333-3333-3333-333333333333', 'FRIDAY', '10:00', '18:00'),
    (gen_random_uuid(), 'b3333333-3333-3333-3333-333333333333', 'SATURDAY', '09:00', '15:00'),

-- 4. Sandton City Branch (Standard)
    (gen_random_uuid(), 'b4444444-4444-4444-4444-444444444444', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b4444444-4444-4444-4444-444444444444', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b4444444-4444-4444-4444-444444444444', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b4444444-4444-4444-4444-444444444444', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b4444444-4444-4444-4444-444444444444', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b4444444-4444-4444-4444-444444444444', 'SATURDAY', '09:00', '13:00'),

-- 5. Umhlanga Rocks Branch (Standard)
    (gen_random_uuid(), 'b5555555-5555-5555-5555-555555555555', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b5555555-5555-5555-5555-555555555555', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b5555555-5555-5555-5555-555555555555', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b5555555-5555-5555-5555-555555555555', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b5555555-5555-5555-5555-555555555555', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b5555555-5555-5555-5555-555555555555', 'SATURDAY', '09:00', '13:00'),

-- 6. Gqeberha Central Branch (Early Bird)
    (gen_random_uuid(), 'b6666666-6666-6666-6666-666666666666', 'MONDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b6666666-6666-6666-6666-666666666666', 'TUESDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b6666666-6666-6666-6666-666666666666', 'WEDNESDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b6666666-6666-6666-6666-666666666666', 'THURSDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b6666666-6666-6666-6666-666666666666', 'FRIDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b6666666-6666-6666-6666-666666666666', 'SATURDAY', '08:00', '11:00'),

-- 7. Bloemfontein Waterfront Branch (Standard)
    (gen_random_uuid(), 'b7777777-7777-7777-7777-777777777777', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b7777777-7777-7777-7777-777777777777', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b7777777-7777-7777-7777-777777777777', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b7777777-7777-7777-7777-777777777777', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b7777777-7777-7777-7777-777777777777', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b7777777-7777-7777-7777-777777777777', 'SATURDAY', '09:00', '13:00'),

-- 8. Polokwane Mall Branch (Standard)
    (gen_random_uuid(), 'b8888888-8888-8888-8888-888888888888', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b8888888-8888-8888-8888-888888888888', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b8888888-8888-8888-8888-888888888888', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b8888888-8888-8888-8888-888888888888', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b8888888-8888-8888-8888-888888888888', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b8888888-8888-8888-8888-888888888888', 'SATURDAY', '09:00', '13:00'),

-- 9. Mbombela Square Branch (Standard)
    (gen_random_uuid(), 'b9999999-9999-9999-9999-999999999999', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b9999999-9999-9999-9999-999999999999', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b9999999-9999-9999-9999-999999999999', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b9999999-9999-9999-9999-999999999999', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b9999999-9999-9999-9999-999999999999', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b9999999-9999-9999-9999-999999999999', 'SATURDAY', '09:00', '13:00'),

-- 10. Kimberley North Branch (Standard)
    (gen_random_uuid(), 'baaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'baaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'baaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'baaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'baaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'baaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'SATURDAY', '09:00', '13:00'),

-- 11. Rustenburg CBD Branch (Early Bird)
    (gen_random_uuid(), 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'MONDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'TUESDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'WEDNESDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'THURSDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'FRIDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'SATURDAY', '08:00', '11:00'),

-- 12. Menlyn Maine Branch (Standard)
    (gen_random_uuid(), 'bccccccc-cccc-cccc-cccc-cccccccccccc', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'bccccccc-cccc-cccc-cccc-cccccccccccc', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'bccccccc-cccc-cccc-cccc-cccccccccccc', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'bccccccc-cccc-cccc-cccc-cccccccccccc', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'bccccccc-cccc-cccc-cccc-cccccccccccc', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'bccccccc-cccc-cccc-cccc-cccccccccccc', 'SATURDAY', '09:00', '13:00'),

-- 13. Durban North Branch (Standard)
    (gen_random_uuid(), 'bddddddd-dddd-dddd-dddd-dddddddddddd', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'bddddddd-dddd-dddd-dddd-dddddddddddd', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'bddddddd-dddd-dddd-dddd-dddddddddddd', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'bddddddd-dddd-dddd-dddd-dddddddddddd', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'bddddddd-dddd-dddd-dddd-dddddddddddd', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'bddddddd-dddd-dddd-dddd-dddddddddddd', 'SATURDAY', '09:00', '13:00'),

-- 14. George Loerie Branch (Standard)
    (gen_random_uuid(), 'beeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'beeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'beeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'beeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'beeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'beeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'SATURDAY', '09:00', '13:00'),

-- 15. Potchefstroom University Branch (Late/Uni)
    (gen_random_uuid(), 'bfffffff-ffff-ffff-ffff-ffffffffffff', 'MONDAY', '10:00', '18:00'),
    (gen_random_uuid(), 'bfffffff-ffff-ffff-ffff-ffffffffffff', 'TUESDAY', '10:00', '18:00'),
    (gen_random_uuid(), 'bfffffff-ffff-ffff-ffff-ffffffffffff', 'WEDNESDAY', '10:00', '18:00'),
    (gen_random_uuid(), 'bfffffff-ffff-ffff-ffff-ffffffffffff', 'THURSDAY', '10:00', '18:00'),
    (gen_random_uuid(), 'bfffffff-ffff-ffff-ffff-ffffffffffff', 'FRIDAY', '10:00', '18:00'),
    (gen_random_uuid(), 'bfffffff-ffff-ffff-ffff-ffffffffffff', 'SATURDAY', '09:00', '15:00'),

-- 16. East London City Branch (Early Bird)
    (gen_random_uuid(), 'b0000000-1111-2222-3333-444444444444', 'MONDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b0000000-1111-2222-3333-444444444444', 'TUESDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b0000000-1111-2222-3333-444444444444', 'WEDNESDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b0000000-1111-2222-3333-444444444444', 'THURSDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b0000000-1111-2222-3333-444444444444', 'FRIDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b0000000-1111-2222-3333-444444444444', 'SATURDAY', '08:00', '11:00'),

-- 17. Soweto Maponya Branch (Standard)
    (gen_random_uuid(), 'b1111111-2222-3333-4444-555555555555', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b1111111-2222-3333-4444-555555555555', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b1111111-2222-3333-4444-555555555555', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b1111111-2222-3333-4444-555555555555', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b1111111-2222-3333-4444-555555555555', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b1111111-2222-3333-4444-555555555555', 'SATURDAY', '09:00', '13:00'),

-- 18. Klerksdorp Mall Branch (Standard)
    (gen_random_uuid(), 'b2222222-3333-4444-5555-666666666666', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b2222222-3333-4444-5555-666666666666', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b2222222-3333-4444-5555-666666666666', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b2222222-3333-4444-5555-666666666666', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b2222222-3333-4444-5555-666666666666', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b2222222-3333-4444-5555-666666666666', 'SATURDAY', '09:00', '13:00'),

-- 19. Welkom CBD Branch (Early Bird)
    (gen_random_uuid(), 'b3333333-4444-5555-6666-777777777777', 'MONDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b3333333-4444-5555-6666-777777777777', 'TUESDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b3333333-4444-5555-6666-777777777777', 'WEDNESDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b3333333-4444-5555-6666-777777777777', 'THURSDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b3333333-4444-5555-6666-777777777777', 'FRIDAY', '08:00', '16:00'),
    (gen_random_uuid(), 'b3333333-4444-5555-6666-777777777777', 'SATURDAY', '08:00', '11:00'),

-- 20. Century City Branch (Standard)
    (gen_random_uuid(), 'b4444444-5555-6666-7777-888888888888', 'MONDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b4444444-5555-6666-7777-888888888888', 'TUESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b4444444-5555-6666-7777-888888888888', 'WEDNESDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b4444444-5555-6666-7777-888888888888', 'THURSDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b4444444-5555-6666-7777-888888888888', 'FRIDAY', '09:00', '17:00'),
    (gen_random_uuid(), 'b4444444-5555-6666-7777-888888888888', 'SATURDAY', '09:00', '13:00');