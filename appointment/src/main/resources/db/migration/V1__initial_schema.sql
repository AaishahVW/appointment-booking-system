-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Users table
CREATE TABLE users (
                       user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                       national_id VARCHAR(20) NOT NULL UNIQUE,
                       first_name VARCHAR(100) NOT NULL,
                       last_name VARCHAR(100) NOT NULL,
                       phone_number VARCHAR(30),
                       email VARCHAR(255) UNIQUE,
                       created_at TIMESTAMP NOT NULL DEFAULT NOW(),
                       updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Branches table
CREATE TABLE branches (
                          branch_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                          branch_name VARCHAR(200) NOT NULL,
                          street_number VARCHAR(20),
                          street_name VARCHAR(200),
                          city VARCHAR(200),
                          province VARCHAR(100),
                          postal_code VARCHAR(20),
                          phone_number VARCHAR(30),
                          email VARCHAR(255),
                          created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Employees table
CREATE TABLE employees (
                           employee_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                           user_id UUID NOT NULL UNIQUE REFERENCES users(user_id),
                           cp_number VARCHAR(50) NOT NULL UNIQUE,
                           branch_id UUID REFERENCES branches(branch_id),
                           work_email VARCHAR(255) UNIQUE,
                           is_active BOOLEAN NOT NULL DEFAULT TRUE,
                           created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Clients table
CREATE TABLE clients (
                         client_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                         user_id UUID NOT NULL UNIQUE REFERENCES users(user_id),
                         ce_number VARCHAR(50) NOT NULL UNIQUE,
                         created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Credentials table
CREATE TABLE credentials (
                             credential_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                             user_id UUID NOT NULL UNIQUE REFERENCES users(user_id) ON DELETE CASCADE,
                             username VARCHAR(255) NOT NULL UNIQUE,
                             password_hash TEXT NOT NULL,
                             created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Case types table
CREATE TABLE case_types (
                            case_type_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                            case_type_name VARCHAR(200) NOT NULL
);

-- Product categories table
CREATE TABLE product_categories (
                                    category_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                                    category_name VARCHAR(200) NOT NULL UNIQUE
);

-- Products table
CREATE TABLE products (
                          product_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                          product_name VARCHAR(200) NOT NULL,
                          category_id UUID REFERENCES product_categories(category_id)
);

-- Branch business hours table
CREATE TABLE branch_business_hours (
                                       hours_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                                       branch_id UUID NOT NULL REFERENCES branches(branch_id),
                                       day_of_week VARCHAR(20) NOT NULL CHECK (
                                           day_of_week IN (
                                                           'MONDAY',
                                                           'TUESDAY',
                                                           'WEDNESDAY',
                                                           'THURSDAY',
                                                           'FRIDAY',
                                                           'SATURDAY',
                                                           'SUNDAY'
                                               )
                                           ),

                                       open_time TIME NOT NULL,
                                       close_time TIME NOT NULL,
                                       UNIQUE(branch_id, day_of_week)
);

-- Time slots table
CREATE TABLE time_slots (
                            slot_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                            start_time TIME NOT NULL,
                            end_time TIME NOT NULL,
                            slot_label VARCHAR(50)
);

-- Appointments table
CREATE TABLE appointments (
                              appointment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

                              client_id UUID NOT NULL REFERENCES clients(client_id),
                              employee_id UUID NOT NULL REFERENCES employees(employee_id),
                              branch_id UUID NOT NULL REFERENCES branches(branch_id),

                              product_id UUID REFERENCES products(product_id),
                              case_type_id UUID REFERENCES case_types(case_type_id),

                              appointment_date DATE NOT NULL,
                              start_time TIME NOT NULL,
                              end_time TIME NOT NULL,

                              status VARCHAR(50) NOT NULL,

                              actual_start_time TIMESTAMP,
                              actual_end_time TIMESTAMP,

                              created_at TIMESTAMP NOT NULL DEFAULT NOW(),
                              updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

                              notes TEXT,

                              CONSTRAINT uq_branch_date_time
                                  UNIQUE (branch_id, appointment_date, start_time)
);

);
